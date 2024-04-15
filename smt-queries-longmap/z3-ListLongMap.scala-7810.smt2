; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97598 () Bool)

(assert start!97598)

(declare-fun b!1114887 () Bool)

(declare-fun e!635355 () Bool)

(declare-fun e!635357 () Bool)

(declare-fun mapRes!43570 () Bool)

(assert (=> b!1114887 (= e!635355 (and e!635357 mapRes!43570))))

(declare-fun condMapEmpty!43570 () Bool)

(declare-datatypes ((V!42241 0))(
  ( (V!42242 (val!13974 Int)) )
))
(declare-datatypes ((ValueCell!13208 0))(
  ( (ValueCellFull!13208 (v!16606 V!42241)) (EmptyCell!13208) )
))
(declare-datatypes ((array!72474 0))(
  ( (array!72475 (arr!34890 (Array (_ BitVec 32) ValueCell!13208)) (size!35428 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72474)

(declare-fun mapDefault!43570 () ValueCell!13208)

(assert (=> b!1114887 (= condMapEmpty!43570 (= (arr!34890 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13208)) mapDefault!43570)))))

(declare-fun b!1114888 () Bool)

(declare-fun e!635353 () Bool)

(assert (=> b!1114888 (= e!635353 (not true))))

(declare-datatypes ((array!72476 0))(
  ( (array!72477 (arr!34891 (Array (_ BitVec 32) (_ BitVec 64))) (size!35429 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72476)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72476 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1114888 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36413 0))(
  ( (Unit!36414) )
))
(declare-fun lt!496716 () Unit!36413)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72476 (_ BitVec 64) (_ BitVec 32)) Unit!36413)

(assert (=> b!1114888 (= lt!496716 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!744283 () Bool)

(declare-fun e!635358 () Bool)

(assert (=> start!97598 (=> (not res!744283) (not e!635358))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97598 (= res!744283 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35429 _keys!1208))))))

(assert (=> start!97598 e!635358))

(declare-fun array_inv!26892 (array!72476) Bool)

(assert (=> start!97598 (array_inv!26892 _keys!1208)))

(assert (=> start!97598 true))

(declare-fun array_inv!26893 (array!72474) Bool)

(assert (=> start!97598 (and (array_inv!26893 _values!996) e!635355)))

(declare-fun b!1114889 () Bool)

(declare-fun tp_is_empty!27835 () Bool)

(assert (=> b!1114889 (= e!635357 tp_is_empty!27835)))

(declare-fun b!1114890 () Bool)

(declare-fun e!635354 () Bool)

(assert (=> b!1114890 (= e!635354 tp_is_empty!27835)))

(declare-fun b!1114891 () Bool)

(declare-fun res!744277 () Bool)

(assert (=> b!1114891 (=> (not res!744277) (not e!635358))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1114891 (= res!744277 (validKeyInArray!0 k0!934))))

(declare-fun b!1114892 () Bool)

(declare-fun res!744275 () Bool)

(assert (=> b!1114892 (=> (not res!744275) (not e!635353))))

(declare-fun lt!496715 () array!72476)

(declare-datatypes ((List!24374 0))(
  ( (Nil!24371) (Cons!24370 (h!25579 (_ BitVec 64)) (t!34846 List!24374)) )
))
(declare-fun arrayNoDuplicates!0 (array!72476 (_ BitVec 32) List!24374) Bool)

(assert (=> b!1114892 (= res!744275 (arrayNoDuplicates!0 lt!496715 #b00000000000000000000000000000000 Nil!24371))))

(declare-fun b!1114893 () Bool)

(declare-fun res!744282 () Bool)

(assert (=> b!1114893 (=> (not res!744282) (not e!635358))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72476 (_ BitVec 32)) Bool)

(assert (=> b!1114893 (= res!744282 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1114894 () Bool)

(declare-fun res!744274 () Bool)

(assert (=> b!1114894 (=> (not res!744274) (not e!635358))))

(assert (=> b!1114894 (= res!744274 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35429 _keys!1208))))))

(declare-fun mapIsEmpty!43570 () Bool)

(assert (=> mapIsEmpty!43570 mapRes!43570))

(declare-fun b!1114895 () Bool)

(declare-fun res!744281 () Bool)

(assert (=> b!1114895 (=> (not res!744281) (not e!635358))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1114895 (= res!744281 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!43570 () Bool)

(declare-fun tp!82814 () Bool)

(assert (=> mapNonEmpty!43570 (= mapRes!43570 (and tp!82814 e!635354))))

(declare-fun mapKey!43570 () (_ BitVec 32))

(declare-fun mapRest!43570 () (Array (_ BitVec 32) ValueCell!13208))

(declare-fun mapValue!43570 () ValueCell!13208)

(assert (=> mapNonEmpty!43570 (= (arr!34890 _values!996) (store mapRest!43570 mapKey!43570 mapValue!43570))))

(declare-fun b!1114896 () Bool)

(assert (=> b!1114896 (= e!635358 e!635353)))

(declare-fun res!744280 () Bool)

(assert (=> b!1114896 (=> (not res!744280) (not e!635353))))

(assert (=> b!1114896 (= res!744280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496715 mask!1564))))

(assert (=> b!1114896 (= lt!496715 (array!72477 (store (arr!34891 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35429 _keys!1208)))))

(declare-fun b!1114897 () Bool)

(declare-fun res!744278 () Bool)

(assert (=> b!1114897 (=> (not res!744278) (not e!635358))))

(assert (=> b!1114897 (= res!744278 (= (select (arr!34891 _keys!1208) i!673) k0!934))))

(declare-fun b!1114898 () Bool)

(declare-fun res!744276 () Bool)

(assert (=> b!1114898 (=> (not res!744276) (not e!635358))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1114898 (= res!744276 (and (= (size!35428 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35429 _keys!1208) (size!35428 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1114899 () Bool)

(declare-fun res!744279 () Bool)

(assert (=> b!1114899 (=> (not res!744279) (not e!635358))))

(assert (=> b!1114899 (= res!744279 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24371))))

(assert (= (and start!97598 res!744283) b!1114895))

(assert (= (and b!1114895 res!744281) b!1114898))

(assert (= (and b!1114898 res!744276) b!1114893))

(assert (= (and b!1114893 res!744282) b!1114899))

(assert (= (and b!1114899 res!744279) b!1114894))

(assert (= (and b!1114894 res!744274) b!1114891))

(assert (= (and b!1114891 res!744277) b!1114897))

(assert (= (and b!1114897 res!744278) b!1114896))

(assert (= (and b!1114896 res!744280) b!1114892))

(assert (= (and b!1114892 res!744275) b!1114888))

(assert (= (and b!1114887 condMapEmpty!43570) mapIsEmpty!43570))

(assert (= (and b!1114887 (not condMapEmpty!43570)) mapNonEmpty!43570))

(get-info :version)

(assert (= (and mapNonEmpty!43570 ((_ is ValueCellFull!13208) mapValue!43570)) b!1114890))

(assert (= (and b!1114887 ((_ is ValueCellFull!13208) mapDefault!43570)) b!1114889))

(assert (= start!97598 b!1114887))

(declare-fun m!1031073 () Bool)

(assert (=> b!1114893 m!1031073))

(declare-fun m!1031075 () Bool)

(assert (=> b!1114892 m!1031075))

(declare-fun m!1031077 () Bool)

(assert (=> mapNonEmpty!43570 m!1031077))

(declare-fun m!1031079 () Bool)

(assert (=> b!1114897 m!1031079))

(declare-fun m!1031081 () Bool)

(assert (=> start!97598 m!1031081))

(declare-fun m!1031083 () Bool)

(assert (=> start!97598 m!1031083))

(declare-fun m!1031085 () Bool)

(assert (=> b!1114895 m!1031085))

(declare-fun m!1031087 () Bool)

(assert (=> b!1114896 m!1031087))

(declare-fun m!1031089 () Bool)

(assert (=> b!1114896 m!1031089))

(declare-fun m!1031091 () Bool)

(assert (=> b!1114899 m!1031091))

(declare-fun m!1031093 () Bool)

(assert (=> b!1114888 m!1031093))

(declare-fun m!1031095 () Bool)

(assert (=> b!1114888 m!1031095))

(declare-fun m!1031097 () Bool)

(assert (=> b!1114891 m!1031097))

(check-sat tp_is_empty!27835 (not b!1114896) (not b!1114899) (not mapNonEmpty!43570) (not start!97598) (not b!1114895) (not b!1114892) (not b!1114888) (not b!1114891) (not b!1114893))
(check-sat)
