; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97468 () Bool)

(assert start!97468)

(declare-fun mapIsEmpty!43366 () Bool)

(declare-fun mapRes!43366 () Bool)

(assert (=> mapIsEmpty!43366 mapRes!43366))

(declare-fun b!1112364 () Bool)

(declare-fun e!634210 () Bool)

(declare-fun e!634211 () Bool)

(assert (=> b!1112364 (= e!634210 (and e!634211 mapRes!43366))))

(declare-fun condMapEmpty!43366 () Bool)

(declare-datatypes ((V!42059 0))(
  ( (V!42060 (val!13906 Int)) )
))
(declare-datatypes ((ValueCell!13140 0))(
  ( (ValueCellFull!13140 (v!16539 V!42059)) (EmptyCell!13140) )
))
(declare-datatypes ((array!72311 0))(
  ( (array!72312 (arr!34808 (Array (_ BitVec 32) ValueCell!13140)) (size!35344 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72311)

(declare-fun mapDefault!43366 () ValueCell!13140)

(assert (=> b!1112364 (= condMapEmpty!43366 (= (arr!34808 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13140)) mapDefault!43366)))))

(declare-fun b!1112365 () Bool)

(declare-fun e!634212 () Bool)

(declare-fun tp_is_empty!27699 () Bool)

(assert (=> b!1112365 (= e!634212 tp_is_empty!27699)))

(declare-fun b!1112366 () Bool)

(declare-fun res!742305 () Bool)

(declare-fun e!634215 () Bool)

(assert (=> b!1112366 (=> (not res!742305) (not e!634215))))

(declare-datatypes ((array!72313 0))(
  ( (array!72314 (arr!34809 (Array (_ BitVec 32) (_ BitVec 64))) (size!35345 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72313)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72313 (_ BitVec 32)) Bool)

(assert (=> b!1112366 (= res!742305 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1112367 () Bool)

(declare-fun res!742311 () Bool)

(assert (=> b!1112367 (=> (not res!742311) (not e!634215))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1112367 (= res!742311 (= (select (arr!34809 _keys!1208) i!673) k0!934))))

(declare-fun b!1112368 () Bool)

(declare-fun res!742312 () Bool)

(declare-fun e!634214 () Bool)

(assert (=> b!1112368 (=> (not res!742312) (not e!634214))))

(declare-fun lt!496507 () array!72313)

(declare-datatypes ((List!24288 0))(
  ( (Nil!24285) (Cons!24284 (h!25493 (_ BitVec 64)) (t!34769 List!24288)) )
))
(declare-fun arrayNoDuplicates!0 (array!72313 (_ BitVec 32) List!24288) Bool)

(assert (=> b!1112368 (= res!742312 (arrayNoDuplicates!0 lt!496507 #b00000000000000000000000000000000 Nil!24285))))

(declare-fun b!1112369 () Bool)

(assert (=> b!1112369 (= e!634211 tp_is_empty!27699)))

(declare-fun b!1112370 () Bool)

(assert (=> b!1112370 (= e!634215 e!634214)))

(declare-fun res!742306 () Bool)

(assert (=> b!1112370 (=> (not res!742306) (not e!634214))))

(assert (=> b!1112370 (= res!742306 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496507 mask!1564))))

(assert (=> b!1112370 (= lt!496507 (array!72314 (store (arr!34809 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35345 _keys!1208)))))

(declare-fun b!1112371 () Bool)

(declare-fun res!742308 () Bool)

(assert (=> b!1112371 (=> (not res!742308) (not e!634215))))

(assert (=> b!1112371 (= res!742308 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35345 _keys!1208))))))

(declare-fun b!1112372 () Bool)

(declare-fun res!742307 () Bool)

(assert (=> b!1112372 (=> (not res!742307) (not e!634215))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1112372 (= res!742307 (validKeyInArray!0 k0!934))))

(declare-fun b!1112373 () Bool)

(declare-fun res!742303 () Bool)

(assert (=> b!1112373 (=> (not res!742303) (not e!634215))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1112373 (= res!742303 (and (= (size!35344 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35345 _keys!1208) (size!35344 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!43366 () Bool)

(declare-fun tp!82610 () Bool)

(assert (=> mapNonEmpty!43366 (= mapRes!43366 (and tp!82610 e!634212))))

(declare-fun mapRest!43366 () (Array (_ BitVec 32) ValueCell!13140))

(declare-fun mapKey!43366 () (_ BitVec 32))

(declare-fun mapValue!43366 () ValueCell!13140)

(assert (=> mapNonEmpty!43366 (= (arr!34808 _values!996) (store mapRest!43366 mapKey!43366 mapValue!43366))))

(declare-fun res!742310 () Bool)

(assert (=> start!97468 (=> (not res!742310) (not e!634215))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97468 (= res!742310 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35345 _keys!1208))))))

(assert (=> start!97468 e!634215))

(declare-fun array_inv!26768 (array!72313) Bool)

(assert (=> start!97468 (array_inv!26768 _keys!1208)))

(assert (=> start!97468 true))

(declare-fun array_inv!26769 (array!72311) Bool)

(assert (=> start!97468 (and (array_inv!26769 _values!996) e!634210)))

(declare-fun b!1112374 () Bool)

(declare-fun res!742309 () Bool)

(assert (=> b!1112374 (=> (not res!742309) (not e!634215))))

(assert (=> b!1112374 (= res!742309 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24285))))

(declare-fun b!1112375 () Bool)

(assert (=> b!1112375 (= e!634214 (not true))))

(declare-fun arrayContainsKey!0 (array!72313 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1112375 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36502 0))(
  ( (Unit!36503) )
))
(declare-fun lt!496508 () Unit!36502)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72313 (_ BitVec 64) (_ BitVec 32)) Unit!36502)

(assert (=> b!1112375 (= lt!496508 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1112376 () Bool)

(declare-fun res!742304 () Bool)

(assert (=> b!1112376 (=> (not res!742304) (not e!634215))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1112376 (= res!742304 (validMask!0 mask!1564))))

(assert (= (and start!97468 res!742310) b!1112376))

(assert (= (and b!1112376 res!742304) b!1112373))

(assert (= (and b!1112373 res!742303) b!1112366))

(assert (= (and b!1112366 res!742305) b!1112374))

(assert (= (and b!1112374 res!742309) b!1112371))

(assert (= (and b!1112371 res!742308) b!1112372))

(assert (= (and b!1112372 res!742307) b!1112367))

(assert (= (and b!1112367 res!742311) b!1112370))

(assert (= (and b!1112370 res!742306) b!1112368))

(assert (= (and b!1112368 res!742312) b!1112375))

(assert (= (and b!1112364 condMapEmpty!43366) mapIsEmpty!43366))

(assert (= (and b!1112364 (not condMapEmpty!43366)) mapNonEmpty!43366))

(get-info :version)

(assert (= (and mapNonEmpty!43366 ((_ is ValueCellFull!13140) mapValue!43366)) b!1112365))

(assert (= (and b!1112364 ((_ is ValueCellFull!13140) mapDefault!43366)) b!1112369))

(assert (= start!97468 b!1112364))

(declare-fun m!1029931 () Bool)

(assert (=> b!1112375 m!1029931))

(declare-fun m!1029933 () Bool)

(assert (=> b!1112375 m!1029933))

(declare-fun m!1029935 () Bool)

(assert (=> b!1112366 m!1029935))

(declare-fun m!1029937 () Bool)

(assert (=> b!1112374 m!1029937))

(declare-fun m!1029939 () Bool)

(assert (=> mapNonEmpty!43366 m!1029939))

(declare-fun m!1029941 () Bool)

(assert (=> b!1112367 m!1029941))

(declare-fun m!1029943 () Bool)

(assert (=> b!1112372 m!1029943))

(declare-fun m!1029945 () Bool)

(assert (=> start!97468 m!1029945))

(declare-fun m!1029947 () Bool)

(assert (=> start!97468 m!1029947))

(declare-fun m!1029949 () Bool)

(assert (=> b!1112376 m!1029949))

(declare-fun m!1029951 () Bool)

(assert (=> b!1112368 m!1029951))

(declare-fun m!1029953 () Bool)

(assert (=> b!1112370 m!1029953))

(declare-fun m!1029955 () Bool)

(assert (=> b!1112370 m!1029955))

(check-sat (not b!1112376) (not start!97468) (not mapNonEmpty!43366) (not b!1112372) (not b!1112375) (not b!1112368) tp_is_empty!27699 (not b!1112366) (not b!1112374) (not b!1112370))
(check-sat)
