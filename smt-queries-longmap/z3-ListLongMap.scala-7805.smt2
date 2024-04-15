; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97568 () Bool)

(assert start!97568)

(declare-fun b!1114302 () Bool)

(declare-fun res!743827 () Bool)

(declare-fun e!635084 () Bool)

(assert (=> b!1114302 (=> (not res!743827) (not e!635084))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!72416 0))(
  ( (array!72417 (arr!34861 (Array (_ BitVec 32) (_ BitVec 64))) (size!35399 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72416)

(assert (=> b!1114302 (= res!743827 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35399 _keys!1208))))))

(declare-fun b!1114303 () Bool)

(declare-fun e!635083 () Bool)

(declare-fun tp_is_empty!27805 () Bool)

(assert (=> b!1114303 (= e!635083 tp_is_empty!27805)))

(declare-fun b!1114304 () Bool)

(declare-fun res!743829 () Bool)

(assert (=> b!1114304 (=> (not res!743829) (not e!635084))))

(declare-datatypes ((List!24362 0))(
  ( (Nil!24359) (Cons!24358 (h!25567 (_ BitVec 64)) (t!34834 List!24362)) )
))
(declare-fun arrayNoDuplicates!0 (array!72416 (_ BitVec 32) List!24362) Bool)

(assert (=> b!1114304 (= res!743829 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24359))))

(declare-fun mapNonEmpty!43525 () Bool)

(declare-fun mapRes!43525 () Bool)

(declare-fun tp!82769 () Bool)

(declare-fun e!635087 () Bool)

(assert (=> mapNonEmpty!43525 (= mapRes!43525 (and tp!82769 e!635087))))

(declare-datatypes ((V!42201 0))(
  ( (V!42202 (val!13959 Int)) )
))
(declare-datatypes ((ValueCell!13193 0))(
  ( (ValueCellFull!13193 (v!16591 V!42201)) (EmptyCell!13193) )
))
(declare-fun mapRest!43525 () (Array (_ BitVec 32) ValueCell!13193))

(declare-fun mapValue!43525 () ValueCell!13193)

(declare-fun mapKey!43525 () (_ BitVec 32))

(declare-datatypes ((array!72418 0))(
  ( (array!72419 (arr!34862 (Array (_ BitVec 32) ValueCell!13193)) (size!35400 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72418)

(assert (=> mapNonEmpty!43525 (= (arr!34862 _values!996) (store mapRest!43525 mapKey!43525 mapValue!43525))))

(declare-fun b!1114305 () Bool)

(declare-fun res!743825 () Bool)

(assert (=> b!1114305 (=> (not res!743825) (not e!635084))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1114305 (= res!743825 (validMask!0 mask!1564))))

(declare-fun b!1114306 () Bool)

(declare-fun res!743830 () Bool)

(assert (=> b!1114306 (=> (not res!743830) (not e!635084))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72416 (_ BitVec 32)) Bool)

(assert (=> b!1114306 (= res!743830 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1114307 () Bool)

(declare-fun e!635088 () Bool)

(assert (=> b!1114307 (= e!635088 (and e!635083 mapRes!43525))))

(declare-fun condMapEmpty!43525 () Bool)

(declare-fun mapDefault!43525 () ValueCell!13193)

(assert (=> b!1114307 (= condMapEmpty!43525 (= (arr!34862 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13193)) mapDefault!43525)))))

(declare-fun b!1114308 () Bool)

(declare-fun res!743831 () Bool)

(assert (=> b!1114308 (=> (not res!743831) (not e!635084))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1114308 (= res!743831 (validKeyInArray!0 k0!934))))

(declare-fun b!1114309 () Bool)

(declare-fun e!635086 () Bool)

(assert (=> b!1114309 (= e!635086 (not true))))

(declare-fun arrayContainsKey!0 (array!72416 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1114309 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36397 0))(
  ( (Unit!36398) )
))
(declare-fun lt!496625 () Unit!36397)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72416 (_ BitVec 64) (_ BitVec 32)) Unit!36397)

(assert (=> b!1114309 (= lt!496625 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!743824 () Bool)

(assert (=> start!97568 (=> (not res!743824) (not e!635084))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97568 (= res!743824 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35399 _keys!1208))))))

(assert (=> start!97568 e!635084))

(declare-fun array_inv!26876 (array!72416) Bool)

(assert (=> start!97568 (array_inv!26876 _keys!1208)))

(assert (=> start!97568 true))

(declare-fun array_inv!26877 (array!72418) Bool)

(assert (=> start!97568 (and (array_inv!26877 _values!996) e!635088)))

(declare-fun b!1114310 () Bool)

(declare-fun res!743826 () Bool)

(assert (=> b!1114310 (=> (not res!743826) (not e!635084))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1114310 (= res!743826 (and (= (size!35400 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35399 _keys!1208) (size!35400 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1114311 () Bool)

(declare-fun res!743833 () Bool)

(assert (=> b!1114311 (=> (not res!743833) (not e!635086))))

(declare-fun lt!496626 () array!72416)

(assert (=> b!1114311 (= res!743833 (arrayNoDuplicates!0 lt!496626 #b00000000000000000000000000000000 Nil!24359))))

(declare-fun b!1114312 () Bool)

(assert (=> b!1114312 (= e!635087 tp_is_empty!27805)))

(declare-fun b!1114313 () Bool)

(assert (=> b!1114313 (= e!635084 e!635086)))

(declare-fun res!743828 () Bool)

(assert (=> b!1114313 (=> (not res!743828) (not e!635086))))

(assert (=> b!1114313 (= res!743828 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496626 mask!1564))))

(assert (=> b!1114313 (= lt!496626 (array!72417 (store (arr!34861 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35399 _keys!1208)))))

(declare-fun mapIsEmpty!43525 () Bool)

(assert (=> mapIsEmpty!43525 mapRes!43525))

(declare-fun b!1114314 () Bool)

(declare-fun res!743832 () Bool)

(assert (=> b!1114314 (=> (not res!743832) (not e!635084))))

(assert (=> b!1114314 (= res!743832 (= (select (arr!34861 _keys!1208) i!673) k0!934))))

(assert (= (and start!97568 res!743824) b!1114305))

(assert (= (and b!1114305 res!743825) b!1114310))

(assert (= (and b!1114310 res!743826) b!1114306))

(assert (= (and b!1114306 res!743830) b!1114304))

(assert (= (and b!1114304 res!743829) b!1114302))

(assert (= (and b!1114302 res!743827) b!1114308))

(assert (= (and b!1114308 res!743831) b!1114314))

(assert (= (and b!1114314 res!743832) b!1114313))

(assert (= (and b!1114313 res!743828) b!1114311))

(assert (= (and b!1114311 res!743833) b!1114309))

(assert (= (and b!1114307 condMapEmpty!43525) mapIsEmpty!43525))

(assert (= (and b!1114307 (not condMapEmpty!43525)) mapNonEmpty!43525))

(get-info :version)

(assert (= (and mapNonEmpty!43525 ((_ is ValueCellFull!13193) mapValue!43525)) b!1114312))

(assert (= (and b!1114307 ((_ is ValueCellFull!13193) mapDefault!43525)) b!1114303))

(assert (= start!97568 b!1114307))

(declare-fun m!1030683 () Bool)

(assert (=> b!1114309 m!1030683))

(declare-fun m!1030685 () Bool)

(assert (=> b!1114309 m!1030685))

(declare-fun m!1030687 () Bool)

(assert (=> mapNonEmpty!43525 m!1030687))

(declare-fun m!1030689 () Bool)

(assert (=> b!1114304 m!1030689))

(declare-fun m!1030691 () Bool)

(assert (=> b!1114306 m!1030691))

(declare-fun m!1030693 () Bool)

(assert (=> b!1114311 m!1030693))

(declare-fun m!1030695 () Bool)

(assert (=> b!1114314 m!1030695))

(declare-fun m!1030697 () Bool)

(assert (=> b!1114313 m!1030697))

(declare-fun m!1030699 () Bool)

(assert (=> b!1114313 m!1030699))

(declare-fun m!1030701 () Bool)

(assert (=> b!1114305 m!1030701))

(declare-fun m!1030703 () Bool)

(assert (=> b!1114308 m!1030703))

(declare-fun m!1030705 () Bool)

(assert (=> start!97568 m!1030705))

(declare-fun m!1030707 () Bool)

(assert (=> start!97568 m!1030707))

(check-sat (not start!97568) (not b!1114311) (not b!1114304) (not b!1114308) (not mapNonEmpty!43525) (not b!1114305) (not b!1114309) (not b!1114306) tp_is_empty!27805 (not b!1114313))
(check-sat)
