; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97810 () Bool)

(assert start!97810)

(declare-fun b!1115758 () Bool)

(declare-fun e!636022 () Bool)

(declare-fun e!636023 () Bool)

(declare-fun mapRes!43525 () Bool)

(assert (=> b!1115758 (= e!636022 (and e!636023 mapRes!43525))))

(declare-fun condMapEmpty!43525 () Bool)

(declare-datatypes ((V!42201 0))(
  ( (V!42202 (val!13959 Int)) )
))
(declare-datatypes ((ValueCell!13193 0))(
  ( (ValueCellFull!13193 (v!16588 V!42201)) (EmptyCell!13193) )
))
(declare-datatypes ((array!72551 0))(
  ( (array!72552 (arr!34922 (Array (_ BitVec 32) ValueCell!13193)) (size!35459 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72551)

(declare-fun mapDefault!43525 () ValueCell!13193)

(assert (=> b!1115758 (= condMapEmpty!43525 (= (arr!34922 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13193)) mapDefault!43525)))))

(declare-fun b!1115759 () Bool)

(declare-fun res!744416 () Bool)

(declare-fun e!636019 () Bool)

(assert (=> b!1115759 (=> (not res!744416) (not e!636019))))

(declare-datatypes ((array!72553 0))(
  ( (array!72554 (arr!34923 (Array (_ BitVec 32) (_ BitVec 64))) (size!35460 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72553)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72553 (_ BitVec 32)) Bool)

(assert (=> b!1115759 (= res!744416 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!43525 () Bool)

(declare-fun tp!82769 () Bool)

(declare-fun e!636024 () Bool)

(assert (=> mapNonEmpty!43525 (= mapRes!43525 (and tp!82769 e!636024))))

(declare-fun mapValue!43525 () ValueCell!13193)

(declare-fun mapRest!43525 () (Array (_ BitVec 32) ValueCell!13193))

(declare-fun mapKey!43525 () (_ BitVec 32))

(assert (=> mapNonEmpty!43525 (= (arr!34922 _values!996) (store mapRest!43525 mapKey!43525 mapValue!43525))))

(declare-fun mapIsEmpty!43525 () Bool)

(assert (=> mapIsEmpty!43525 mapRes!43525))

(declare-fun b!1115760 () Bool)

(declare-fun res!744424 () Bool)

(declare-fun e!636020 () Bool)

(assert (=> b!1115760 (=> (not res!744424) (not e!636020))))

(declare-fun lt!497340 () array!72553)

(declare-datatypes ((List!24346 0))(
  ( (Nil!24343) (Cons!24342 (h!25560 (_ BitVec 64)) (t!34819 List!24346)) )
))
(declare-fun arrayNoDuplicates!0 (array!72553 (_ BitVec 32) List!24346) Bool)

(assert (=> b!1115760 (= res!744424 (arrayNoDuplicates!0 lt!497340 #b00000000000000000000000000000000 Nil!24343))))

(declare-fun b!1115761 () Bool)

(declare-fun tp_is_empty!27805 () Bool)

(assert (=> b!1115761 (= e!636023 tp_is_empty!27805)))

(declare-fun b!1115762 () Bool)

(declare-fun res!744422 () Bool)

(assert (=> b!1115762 (=> (not res!744422) (not e!636019))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1115762 (= res!744422 (validMask!0 mask!1564))))

(declare-fun b!1115763 () Bool)

(declare-fun res!744419 () Bool)

(assert (=> b!1115763 (=> (not res!744419) (not e!636019))))

(assert (=> b!1115763 (= res!744419 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24343))))

(declare-fun b!1115764 () Bool)

(declare-fun res!744420 () Bool)

(assert (=> b!1115764 (=> (not res!744420) (not e!636019))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1115764 (= res!744420 (= (select (arr!34923 _keys!1208) i!673) k0!934))))

(declare-fun b!1115765 () Bool)

(assert (=> b!1115765 (= e!636020 (not true))))

(declare-fun arrayContainsKey!0 (array!72553 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1115765 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36545 0))(
  ( (Unit!36546) )
))
(declare-fun lt!497341 () Unit!36545)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72553 (_ BitVec 64) (_ BitVec 32)) Unit!36545)

(assert (=> b!1115765 (= lt!497341 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!744418 () Bool)

(assert (=> start!97810 (=> (not res!744418) (not e!636019))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97810 (= res!744418 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35460 _keys!1208))))))

(assert (=> start!97810 e!636019))

(declare-fun array_inv!26908 (array!72553) Bool)

(assert (=> start!97810 (array_inv!26908 _keys!1208)))

(assert (=> start!97810 true))

(declare-fun array_inv!26909 (array!72551) Bool)

(assert (=> start!97810 (and (array_inv!26909 _values!996) e!636022)))

(declare-fun b!1115766 () Bool)

(declare-fun res!744415 () Bool)

(assert (=> b!1115766 (=> (not res!744415) (not e!636019))))

(assert (=> b!1115766 (= res!744415 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35460 _keys!1208))))))

(declare-fun b!1115767 () Bool)

(assert (=> b!1115767 (= e!636024 tp_is_empty!27805)))

(declare-fun b!1115768 () Bool)

(assert (=> b!1115768 (= e!636019 e!636020)))

(declare-fun res!744421 () Bool)

(assert (=> b!1115768 (=> (not res!744421) (not e!636020))))

(assert (=> b!1115768 (= res!744421 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497340 mask!1564))))

(assert (=> b!1115768 (= lt!497340 (array!72554 (store (arr!34923 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35460 _keys!1208)))))

(declare-fun b!1115769 () Bool)

(declare-fun res!744423 () Bool)

(assert (=> b!1115769 (=> (not res!744423) (not e!636019))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1115769 (= res!744423 (and (= (size!35459 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35460 _keys!1208) (size!35459 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1115770 () Bool)

(declare-fun res!744417 () Bool)

(assert (=> b!1115770 (=> (not res!744417) (not e!636019))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1115770 (= res!744417 (validKeyInArray!0 k0!934))))

(assert (= (and start!97810 res!744418) b!1115762))

(assert (= (and b!1115762 res!744422) b!1115769))

(assert (= (and b!1115769 res!744423) b!1115759))

(assert (= (and b!1115759 res!744416) b!1115763))

(assert (= (and b!1115763 res!744419) b!1115766))

(assert (= (and b!1115766 res!744415) b!1115770))

(assert (= (and b!1115770 res!744417) b!1115764))

(assert (= (and b!1115764 res!744420) b!1115768))

(assert (= (and b!1115768 res!744421) b!1115760))

(assert (= (and b!1115760 res!744424) b!1115765))

(assert (= (and b!1115758 condMapEmpty!43525) mapIsEmpty!43525))

(assert (= (and b!1115758 (not condMapEmpty!43525)) mapNonEmpty!43525))

(get-info :version)

(assert (= (and mapNonEmpty!43525 ((_ is ValueCellFull!13193) mapValue!43525)) b!1115767))

(assert (= (and b!1115758 ((_ is ValueCellFull!13193) mapDefault!43525)) b!1115761))

(assert (= start!97810 b!1115758))

(declare-fun m!1032981 () Bool)

(assert (=> b!1115762 m!1032981))

(declare-fun m!1032983 () Bool)

(assert (=> b!1115765 m!1032983))

(declare-fun m!1032985 () Bool)

(assert (=> b!1115765 m!1032985))

(declare-fun m!1032987 () Bool)

(assert (=> b!1115759 m!1032987))

(declare-fun m!1032989 () Bool)

(assert (=> b!1115760 m!1032989))

(declare-fun m!1032991 () Bool)

(assert (=> b!1115768 m!1032991))

(declare-fun m!1032993 () Bool)

(assert (=> b!1115768 m!1032993))

(declare-fun m!1032995 () Bool)

(assert (=> start!97810 m!1032995))

(declare-fun m!1032997 () Bool)

(assert (=> start!97810 m!1032997))

(declare-fun m!1032999 () Bool)

(assert (=> b!1115770 m!1032999))

(declare-fun m!1033001 () Bool)

(assert (=> b!1115764 m!1033001))

(declare-fun m!1033003 () Bool)

(assert (=> mapNonEmpty!43525 m!1033003))

(declare-fun m!1033005 () Bool)

(assert (=> b!1115763 m!1033005))

(check-sat (not b!1115765) (not b!1115763) (not b!1115762) (not b!1115770) (not b!1115759) tp_is_empty!27805 (not mapNonEmpty!43525) (not b!1115768) (not start!97810) (not b!1115760))
(check-sat)
