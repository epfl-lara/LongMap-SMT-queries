; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97996 () Bool)

(assert start!97996)

(declare-fun b_free!23461 () Bool)

(declare-fun b_next!23461 () Bool)

(assert (=> start!97996 (= b_free!23461 (not b_next!23461))))

(declare-fun tp!83087 () Bool)

(declare-fun b_and!37745 () Bool)

(assert (=> start!97996 (= tp!83087 b_and!37745)))

(declare-fun b!1119423 () Bool)

(declare-fun e!637731 () Bool)

(declare-fun tp_is_empty!27991 () Bool)

(assert (=> b!1119423 (= e!637731 tp_is_empty!27991)))

(declare-fun b!1119424 () Bool)

(declare-fun e!637734 () Bool)

(declare-fun e!637736 () Bool)

(assert (=> b!1119424 (= e!637734 (not e!637736))))

(declare-fun res!747252 () Bool)

(assert (=> b!1119424 (=> res!747252 e!637736)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1119424 (= res!747252 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!72919 0))(
  ( (array!72920 (arr!35106 (Array (_ BitVec 32) (_ BitVec 64))) (size!35643 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72919)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72919 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1119424 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36677 0))(
  ( (Unit!36678) )
))
(declare-fun lt!497936 () Unit!36677)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72919 (_ BitVec 64) (_ BitVec 32)) Unit!36677)

(assert (=> b!1119424 (= lt!497936 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1119425 () Bool)

(declare-fun res!747251 () Bool)

(declare-fun e!637737 () Bool)

(assert (=> b!1119425 (=> (not res!747251) (not e!637737))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72919 (_ BitVec 32)) Bool)

(assert (=> b!1119425 (= res!747251 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1119426 () Bool)

(assert (=> b!1119426 (= e!637737 e!637734)))

(declare-fun res!747253 () Bool)

(assert (=> b!1119426 (=> (not res!747253) (not e!637734))))

(declare-fun lt!497938 () array!72919)

(assert (=> b!1119426 (= res!747253 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497938 mask!1564))))

(assert (=> b!1119426 (= lt!497938 (array!72920 (store (arr!35106 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35643 _keys!1208)))))

(declare-fun b!1119427 () Bool)

(declare-fun e!637735 () Bool)

(declare-fun mapRes!43804 () Bool)

(assert (=> b!1119427 (= e!637735 (and e!637731 mapRes!43804))))

(declare-fun condMapEmpty!43804 () Bool)

(declare-datatypes ((V!42449 0))(
  ( (V!42450 (val!14052 Int)) )
))
(declare-datatypes ((ValueCell!13286 0))(
  ( (ValueCellFull!13286 (v!16681 V!42449)) (EmptyCell!13286) )
))
(declare-datatypes ((array!72921 0))(
  ( (array!72922 (arr!35107 (Array (_ BitVec 32) ValueCell!13286)) (size!35644 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72921)

(declare-fun mapDefault!43804 () ValueCell!13286)

(assert (=> b!1119427 (= condMapEmpty!43804 (= (arr!35107 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13286)) mapDefault!43804)))))

(declare-fun res!747243 () Bool)

(assert (=> start!97996 (=> (not res!747243) (not e!637737))))

(assert (=> start!97996 (= res!747243 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35643 _keys!1208))))))

(assert (=> start!97996 e!637737))

(assert (=> start!97996 tp_is_empty!27991))

(declare-fun array_inv!27040 (array!72919) Bool)

(assert (=> start!97996 (array_inv!27040 _keys!1208)))

(assert (=> start!97996 true))

(assert (=> start!97996 tp!83087))

(declare-fun array_inv!27041 (array!72921) Bool)

(assert (=> start!97996 (and (array_inv!27041 _values!996) e!637735)))

(declare-fun b!1119428 () Bool)

(declare-fun res!747245 () Bool)

(assert (=> b!1119428 (=> (not res!747245) (not e!637737))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1119428 (= res!747245 (validMask!0 mask!1564))))

(declare-fun b!1119429 () Bool)

(declare-fun res!747246 () Bool)

(assert (=> b!1119429 (=> (not res!747246) (not e!637734))))

(declare-datatypes ((List!24430 0))(
  ( (Nil!24427) (Cons!24426 (h!25644 (_ BitVec 64)) (t!34903 List!24430)) )
))
(declare-fun arrayNoDuplicates!0 (array!72919 (_ BitVec 32) List!24430) Bool)

(assert (=> b!1119429 (= res!747246 (arrayNoDuplicates!0 lt!497938 #b00000000000000000000000000000000 Nil!24427))))

(declare-fun mapIsEmpty!43804 () Bool)

(assert (=> mapIsEmpty!43804 mapRes!43804))

(declare-fun mapNonEmpty!43804 () Bool)

(declare-fun tp!83086 () Bool)

(declare-fun e!637732 () Bool)

(assert (=> mapNonEmpty!43804 (= mapRes!43804 (and tp!83086 e!637732))))

(declare-fun mapRest!43804 () (Array (_ BitVec 32) ValueCell!13286))

(declare-fun mapKey!43804 () (_ BitVec 32))

(declare-fun mapValue!43804 () ValueCell!13286)

(assert (=> mapNonEmpty!43804 (= (arr!35107 _values!996) (store mapRest!43804 mapKey!43804 mapValue!43804))))

(declare-fun b!1119430 () Bool)

(declare-fun res!747244 () Bool)

(assert (=> b!1119430 (=> (not res!747244) (not e!637737))))

(assert (=> b!1119430 (= res!747244 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35643 _keys!1208))))))

(declare-fun b!1119431 () Bool)

(assert (=> b!1119431 (= e!637732 tp_is_empty!27991)))

(declare-fun b!1119432 () Bool)

(declare-fun res!747248 () Bool)

(assert (=> b!1119432 (=> (not res!747248) (not e!637737))))

(assert (=> b!1119432 (= res!747248 (= (select (arr!35106 _keys!1208) i!673) k0!934))))

(declare-fun b!1119433 () Bool)

(assert (=> b!1119433 (= e!637736 true)))

(declare-fun zeroValue!944 () V!42449)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!17640 0))(
  ( (tuple2!17641 (_1!8831 (_ BitVec 64)) (_2!8831 V!42449)) )
))
(declare-datatypes ((List!24431 0))(
  ( (Nil!24428) (Cons!24427 (h!25645 tuple2!17640) (t!34904 List!24431)) )
))
(declare-datatypes ((ListLongMap!15617 0))(
  ( (ListLongMap!15618 (toList!7824 List!24431)) )
))
(declare-fun lt!497937 () ListLongMap!15617)

(declare-fun minValue!944 () V!42449)

(declare-fun getCurrentListMapNoExtraKeys!4354 (array!72919 array!72921 (_ BitVec 32) (_ BitVec 32) V!42449 V!42449 (_ BitVec 32) Int) ListLongMap!15617)

(assert (=> b!1119433 (= lt!497937 (getCurrentListMapNoExtraKeys!4354 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1119434 () Bool)

(declare-fun res!747250 () Bool)

(assert (=> b!1119434 (=> (not res!747250) (not e!637737))))

(assert (=> b!1119434 (= res!747250 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24427))))

(declare-fun b!1119435 () Bool)

(declare-fun res!747247 () Bool)

(assert (=> b!1119435 (=> (not res!747247) (not e!637737))))

(assert (=> b!1119435 (= res!747247 (and (= (size!35644 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35643 _keys!1208) (size!35644 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1119436 () Bool)

(declare-fun res!747249 () Bool)

(assert (=> b!1119436 (=> (not res!747249) (not e!637737))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1119436 (= res!747249 (validKeyInArray!0 k0!934))))

(assert (= (and start!97996 res!747243) b!1119428))

(assert (= (and b!1119428 res!747245) b!1119435))

(assert (= (and b!1119435 res!747247) b!1119425))

(assert (= (and b!1119425 res!747251) b!1119434))

(assert (= (and b!1119434 res!747250) b!1119430))

(assert (= (and b!1119430 res!747244) b!1119436))

(assert (= (and b!1119436 res!747249) b!1119432))

(assert (= (and b!1119432 res!747248) b!1119426))

(assert (= (and b!1119426 res!747253) b!1119429))

(assert (= (and b!1119429 res!747246) b!1119424))

(assert (= (and b!1119424 (not res!747252)) b!1119433))

(assert (= (and b!1119427 condMapEmpty!43804) mapIsEmpty!43804))

(assert (= (and b!1119427 (not condMapEmpty!43804)) mapNonEmpty!43804))

(get-info :version)

(assert (= (and mapNonEmpty!43804 ((_ is ValueCellFull!13286) mapValue!43804)) b!1119431))

(assert (= (and b!1119427 ((_ is ValueCellFull!13286) mapDefault!43804)) b!1119423))

(assert (= start!97996 b!1119427))

(declare-fun m!1035423 () Bool)

(assert (=> b!1119436 m!1035423))

(declare-fun m!1035425 () Bool)

(assert (=> b!1119434 m!1035425))

(declare-fun m!1035427 () Bool)

(assert (=> b!1119428 m!1035427))

(declare-fun m!1035429 () Bool)

(assert (=> b!1119424 m!1035429))

(declare-fun m!1035431 () Bool)

(assert (=> b!1119424 m!1035431))

(declare-fun m!1035433 () Bool)

(assert (=> mapNonEmpty!43804 m!1035433))

(declare-fun m!1035435 () Bool)

(assert (=> b!1119433 m!1035435))

(declare-fun m!1035437 () Bool)

(assert (=> b!1119426 m!1035437))

(declare-fun m!1035439 () Bool)

(assert (=> b!1119426 m!1035439))

(declare-fun m!1035441 () Bool)

(assert (=> b!1119432 m!1035441))

(declare-fun m!1035443 () Bool)

(assert (=> start!97996 m!1035443))

(declare-fun m!1035445 () Bool)

(assert (=> start!97996 m!1035445))

(declare-fun m!1035447 () Bool)

(assert (=> b!1119425 m!1035447))

(declare-fun m!1035449 () Bool)

(assert (=> b!1119429 m!1035449))

(check-sat (not b!1119425) (not start!97996) (not b!1119428) (not b!1119434) b_and!37745 (not b_next!23461) (not b!1119436) (not b!1119433) (not mapNonEmpty!43804) (not b!1119429) tp_is_empty!27991 (not b!1119426) (not b!1119424))
(check-sat b_and!37745 (not b_next!23461))
