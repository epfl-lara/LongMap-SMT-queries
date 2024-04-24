; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97702 () Bool)

(assert start!97702)

(declare-fun b!1113652 () Bool)

(declare-fun res!742795 () Bool)

(declare-fun e!635049 () Bool)

(assert (=> b!1113652 (=> (not res!742795) (not e!635049))))

(declare-datatypes ((array!72345 0))(
  ( (array!72346 (arr!34819 (Array (_ BitVec 32) (_ BitVec 64))) (size!35356 (_ BitVec 32))) )
))
(declare-fun lt!497016 () array!72345)

(declare-datatypes ((List!24307 0))(
  ( (Nil!24304) (Cons!24303 (h!25521 (_ BitVec 64)) (t!34780 List!24307)) )
))
(declare-fun arrayNoDuplicates!0 (array!72345 (_ BitVec 32) List!24307) Bool)

(assert (=> b!1113652 (= res!742795 (arrayNoDuplicates!0 lt!497016 #b00000000000000000000000000000000 Nil!24304))))

(declare-fun b!1113653 () Bool)

(declare-fun res!742797 () Bool)

(declare-fun e!635047 () Bool)

(assert (=> b!1113653 (=> (not res!742797) (not e!635047))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1113653 (= res!742797 (validKeyInArray!0 k0!934))))

(declare-fun b!1113654 () Bool)

(declare-fun e!635051 () Bool)

(declare-fun e!635052 () Bool)

(declare-fun mapRes!43363 () Bool)

(assert (=> b!1113654 (= e!635051 (and e!635052 mapRes!43363))))

(declare-fun condMapEmpty!43363 () Bool)

(declare-datatypes ((V!42057 0))(
  ( (V!42058 (val!13905 Int)) )
))
(declare-datatypes ((ValueCell!13139 0))(
  ( (ValueCellFull!13139 (v!16534 V!42057)) (EmptyCell!13139) )
))
(declare-datatypes ((array!72347 0))(
  ( (array!72348 (arr!34820 (Array (_ BitVec 32) ValueCell!13139)) (size!35357 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72347)

(declare-fun mapDefault!43363 () ValueCell!13139)

(assert (=> b!1113654 (= condMapEmpty!43363 (= (arr!34820 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13139)) mapDefault!43363)))))

(declare-fun b!1113655 () Bool)

(declare-fun tp_is_empty!27697 () Bool)

(assert (=> b!1113655 (= e!635052 tp_is_empty!27697)))

(declare-fun b!1113656 () Bool)

(declare-fun res!742802 () Bool)

(assert (=> b!1113656 (=> (not res!742802) (not e!635047))))

(declare-fun _keys!1208 () array!72345)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1113656 (= res!742802 (and (= (size!35357 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35356 _keys!1208) (size!35357 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1113657 () Bool)

(declare-fun res!742803 () Bool)

(assert (=> b!1113657 (=> (not res!742803) (not e!635047))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72345 (_ BitVec 32)) Bool)

(assert (=> b!1113657 (= res!742803 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!43363 () Bool)

(assert (=> mapIsEmpty!43363 mapRes!43363))

(declare-fun b!1113658 () Bool)

(declare-fun res!742798 () Bool)

(assert (=> b!1113658 (=> (not res!742798) (not e!635047))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1113658 (= res!742798 (= (select (arr!34819 _keys!1208) i!673) k0!934))))

(declare-fun res!742796 () Bool)

(assert (=> start!97702 (=> (not res!742796) (not e!635047))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97702 (= res!742796 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35356 _keys!1208))))))

(assert (=> start!97702 e!635047))

(declare-fun array_inv!26830 (array!72345) Bool)

(assert (=> start!97702 (array_inv!26830 _keys!1208)))

(assert (=> start!97702 true))

(declare-fun array_inv!26831 (array!72347) Bool)

(assert (=> start!97702 (and (array_inv!26831 _values!996) e!635051)))

(declare-fun mapNonEmpty!43363 () Bool)

(declare-fun tp!82607 () Bool)

(declare-fun e!635050 () Bool)

(assert (=> mapNonEmpty!43363 (= mapRes!43363 (and tp!82607 e!635050))))

(declare-fun mapKey!43363 () (_ BitVec 32))

(declare-fun mapValue!43363 () ValueCell!13139)

(declare-fun mapRest!43363 () (Array (_ BitVec 32) ValueCell!13139))

(assert (=> mapNonEmpty!43363 (= (arr!34820 _values!996) (store mapRest!43363 mapKey!43363 mapValue!43363))))

(declare-fun b!1113659 () Bool)

(assert (=> b!1113659 (= e!635047 e!635049)))

(declare-fun res!742804 () Bool)

(assert (=> b!1113659 (=> (not res!742804) (not e!635049))))

(assert (=> b!1113659 (= res!742804 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497016 mask!1564))))

(assert (=> b!1113659 (= lt!497016 (array!72346 (store (arr!34819 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35356 _keys!1208)))))

(declare-fun b!1113660 () Bool)

(declare-fun res!742799 () Bool)

(assert (=> b!1113660 (=> (not res!742799) (not e!635047))))

(assert (=> b!1113660 (= res!742799 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35356 _keys!1208))))))

(declare-fun b!1113661 () Bool)

(declare-fun res!742801 () Bool)

(assert (=> b!1113661 (=> (not res!742801) (not e!635047))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1113661 (= res!742801 (validMask!0 mask!1564))))

(declare-fun b!1113662 () Bool)

(assert (=> b!1113662 (= e!635049 (not true))))

(declare-fun arrayContainsKey!0 (array!72345 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1113662 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36481 0))(
  ( (Unit!36482) )
))
(declare-fun lt!497017 () Unit!36481)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72345 (_ BitVec 64) (_ BitVec 32)) Unit!36481)

(assert (=> b!1113662 (= lt!497017 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1113663 () Bool)

(assert (=> b!1113663 (= e!635050 tp_is_empty!27697)))

(declare-fun b!1113664 () Bool)

(declare-fun res!742800 () Bool)

(assert (=> b!1113664 (=> (not res!742800) (not e!635047))))

(assert (=> b!1113664 (= res!742800 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24304))))

(assert (= (and start!97702 res!742796) b!1113661))

(assert (= (and b!1113661 res!742801) b!1113656))

(assert (= (and b!1113656 res!742802) b!1113657))

(assert (= (and b!1113657 res!742803) b!1113664))

(assert (= (and b!1113664 res!742800) b!1113660))

(assert (= (and b!1113660 res!742799) b!1113653))

(assert (= (and b!1113653 res!742797) b!1113658))

(assert (= (and b!1113658 res!742798) b!1113659))

(assert (= (and b!1113659 res!742804) b!1113652))

(assert (= (and b!1113652 res!742795) b!1113662))

(assert (= (and b!1113654 condMapEmpty!43363) mapIsEmpty!43363))

(assert (= (and b!1113654 (not condMapEmpty!43363)) mapNonEmpty!43363))

(get-info :version)

(assert (= (and mapNonEmpty!43363 ((_ is ValueCellFull!13139) mapValue!43363)) b!1113663))

(assert (= (and b!1113654 ((_ is ValueCellFull!13139) mapDefault!43363)) b!1113655))

(assert (= start!97702 b!1113654))

(declare-fun m!1031577 () Bool)

(assert (=> b!1113662 m!1031577))

(declare-fun m!1031579 () Bool)

(assert (=> b!1113662 m!1031579))

(declare-fun m!1031581 () Bool)

(assert (=> b!1113661 m!1031581))

(declare-fun m!1031583 () Bool)

(assert (=> start!97702 m!1031583))

(declare-fun m!1031585 () Bool)

(assert (=> start!97702 m!1031585))

(declare-fun m!1031587 () Bool)

(assert (=> b!1113653 m!1031587))

(declare-fun m!1031589 () Bool)

(assert (=> b!1113657 m!1031589))

(declare-fun m!1031591 () Bool)

(assert (=> b!1113664 m!1031591))

(declare-fun m!1031593 () Bool)

(assert (=> b!1113652 m!1031593))

(declare-fun m!1031595 () Bool)

(assert (=> mapNonEmpty!43363 m!1031595))

(declare-fun m!1031597 () Bool)

(assert (=> b!1113658 m!1031597))

(declare-fun m!1031599 () Bool)

(assert (=> b!1113659 m!1031599))

(declare-fun m!1031601 () Bool)

(assert (=> b!1113659 m!1031601))

(check-sat (not b!1113652) (not b!1113661) (not b!1113662) (not start!97702) (not b!1113657) (not b!1113664) (not mapNonEmpty!43363) (not b!1113659) tp_is_empty!27697 (not b!1113653))
(check-sat)
