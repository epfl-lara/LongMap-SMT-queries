; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97600 () Bool)

(assert start!97600)

(declare-fun b!1114938 () Bool)

(declare-fun res!744286 () Bool)

(declare-fun e!635399 () Bool)

(assert (=> b!1114938 (=> (not res!744286) (not e!635399))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1114938 (= res!744286 (validKeyInArray!0 k0!934))))

(declare-fun b!1114939 () Bool)

(declare-fun res!744284 () Bool)

(assert (=> b!1114939 (=> (not res!744284) (not e!635399))))

(declare-datatypes ((array!72567 0))(
  ( (array!72568 (arr!34936 (Array (_ BitVec 32) (_ BitVec 64))) (size!35472 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72567)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1114939 (= res!744284 (= (select (arr!34936 _keys!1208) i!673) k0!934))))

(declare-fun b!1114940 () Bool)

(declare-fun e!635401 () Bool)

(assert (=> b!1114940 (= e!635399 e!635401)))

(declare-fun res!744283 () Bool)

(assert (=> b!1114940 (=> (not res!744283) (not e!635401))))

(declare-fun lt!496904 () array!72567)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72567 (_ BitVec 32)) Bool)

(assert (=> b!1114940 (= res!744283 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496904 mask!1564))))

(assert (=> b!1114940 (= lt!496904 (array!72568 (store (arr!34936 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35472 _keys!1208)))))

(declare-fun mapIsEmpty!43564 () Bool)

(declare-fun mapRes!43564 () Bool)

(assert (=> mapIsEmpty!43564 mapRes!43564))

(declare-fun b!1114942 () Bool)

(declare-fun e!635400 () Bool)

(declare-fun tp_is_empty!27831 () Bool)

(assert (=> b!1114942 (= e!635400 tp_is_empty!27831)))

(declare-fun mapNonEmpty!43564 () Bool)

(declare-fun tp!82808 () Bool)

(declare-fun e!635398 () Bool)

(assert (=> mapNonEmpty!43564 (= mapRes!43564 (and tp!82808 e!635398))))

(declare-datatypes ((V!42235 0))(
  ( (V!42236 (val!13972 Int)) )
))
(declare-datatypes ((ValueCell!13206 0))(
  ( (ValueCellFull!13206 (v!16605 V!42235)) (EmptyCell!13206) )
))
(declare-fun mapValue!43564 () ValueCell!13206)

(declare-fun mapKey!43564 () (_ BitVec 32))

(declare-fun mapRest!43564 () (Array (_ BitVec 32) ValueCell!13206))

(declare-datatypes ((array!72569 0))(
  ( (array!72570 (arr!34937 (Array (_ BitVec 32) ValueCell!13206)) (size!35473 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72569)

(assert (=> mapNonEmpty!43564 (= (arr!34937 _values!996) (store mapRest!43564 mapKey!43564 mapValue!43564))))

(declare-fun b!1114943 () Bool)

(assert (=> b!1114943 (= e!635398 tp_is_empty!27831)))

(declare-fun b!1114944 () Bool)

(declare-fun res!744288 () Bool)

(assert (=> b!1114944 (=> (not res!744288) (not e!635401))))

(declare-datatypes ((List!24338 0))(
  ( (Nil!24335) (Cons!24334 (h!25543 (_ BitVec 64)) (t!34819 List!24338)) )
))
(declare-fun arrayNoDuplicates!0 (array!72567 (_ BitVec 32) List!24338) Bool)

(assert (=> b!1114944 (= res!744288 (arrayNoDuplicates!0 lt!496904 #b00000000000000000000000000000000 Nil!24335))))

(declare-fun b!1114945 () Bool)

(declare-fun res!744289 () Bool)

(assert (=> b!1114945 (=> (not res!744289) (not e!635399))))

(assert (=> b!1114945 (= res!744289 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35472 _keys!1208))))))

(declare-fun b!1114946 () Bool)

(declare-fun res!744290 () Bool)

(assert (=> b!1114946 (=> (not res!744290) (not e!635399))))

(assert (=> b!1114946 (= res!744290 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24335))))

(declare-fun b!1114947 () Bool)

(declare-fun res!744292 () Bool)

(assert (=> b!1114947 (=> (not res!744292) (not e!635399))))

(assert (=> b!1114947 (= res!744292 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1114948 () Bool)

(assert (=> b!1114948 (= e!635401 (not true))))

(declare-fun arrayContainsKey!0 (array!72567 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1114948 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36594 0))(
  ( (Unit!36595) )
))
(declare-fun lt!496903 () Unit!36594)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72567 (_ BitVec 64) (_ BitVec 32)) Unit!36594)

(assert (=> b!1114948 (= lt!496903 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!744287 () Bool)

(assert (=> start!97600 (=> (not res!744287) (not e!635399))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97600 (= res!744287 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35472 _keys!1208))))))

(assert (=> start!97600 e!635399))

(declare-fun array_inv!26858 (array!72567) Bool)

(assert (=> start!97600 (array_inv!26858 _keys!1208)))

(assert (=> start!97600 true))

(declare-fun e!635402 () Bool)

(declare-fun array_inv!26859 (array!72569) Bool)

(assert (=> start!97600 (and (array_inv!26859 _values!996) e!635402)))

(declare-fun b!1114941 () Bool)

(declare-fun res!744285 () Bool)

(assert (=> b!1114941 (=> (not res!744285) (not e!635399))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1114941 (= res!744285 (validMask!0 mask!1564))))

(declare-fun b!1114949 () Bool)

(declare-fun res!744291 () Bool)

(assert (=> b!1114949 (=> (not res!744291) (not e!635399))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1114949 (= res!744291 (and (= (size!35473 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35472 _keys!1208) (size!35473 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1114950 () Bool)

(assert (=> b!1114950 (= e!635402 (and e!635400 mapRes!43564))))

(declare-fun condMapEmpty!43564 () Bool)

(declare-fun mapDefault!43564 () ValueCell!13206)

(assert (=> b!1114950 (= condMapEmpty!43564 (= (arr!34937 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13206)) mapDefault!43564)))))

(assert (= (and start!97600 res!744287) b!1114941))

(assert (= (and b!1114941 res!744285) b!1114949))

(assert (= (and b!1114949 res!744291) b!1114947))

(assert (= (and b!1114947 res!744292) b!1114946))

(assert (= (and b!1114946 res!744290) b!1114945))

(assert (= (and b!1114945 res!744289) b!1114938))

(assert (= (and b!1114938 res!744286) b!1114939))

(assert (= (and b!1114939 res!744284) b!1114940))

(assert (= (and b!1114940 res!744283) b!1114944))

(assert (= (and b!1114944 res!744288) b!1114948))

(assert (= (and b!1114950 condMapEmpty!43564) mapIsEmpty!43564))

(assert (= (and b!1114950 (not condMapEmpty!43564)) mapNonEmpty!43564))

(get-info :version)

(assert (= (and mapNonEmpty!43564 ((_ is ValueCellFull!13206) mapValue!43564)) b!1114943))

(assert (= (and b!1114950 ((_ is ValueCellFull!13206) mapDefault!43564)) b!1114942))

(assert (= start!97600 b!1114950))

(declare-fun m!1031647 () Bool)

(assert (=> b!1114944 m!1031647))

(declare-fun m!1031649 () Bool)

(assert (=> b!1114940 m!1031649))

(declare-fun m!1031651 () Bool)

(assert (=> b!1114940 m!1031651))

(declare-fun m!1031653 () Bool)

(assert (=> mapNonEmpty!43564 m!1031653))

(declare-fun m!1031655 () Bool)

(assert (=> b!1114938 m!1031655))

(declare-fun m!1031657 () Bool)

(assert (=> b!1114941 m!1031657))

(declare-fun m!1031659 () Bool)

(assert (=> b!1114946 m!1031659))

(declare-fun m!1031661 () Bool)

(assert (=> b!1114947 m!1031661))

(declare-fun m!1031663 () Bool)

(assert (=> start!97600 m!1031663))

(declare-fun m!1031665 () Bool)

(assert (=> start!97600 m!1031665))

(declare-fun m!1031667 () Bool)

(assert (=> b!1114939 m!1031667))

(declare-fun m!1031669 () Bool)

(assert (=> b!1114948 m!1031669))

(declare-fun m!1031671 () Bool)

(assert (=> b!1114948 m!1031671))

(check-sat (not b!1114938) (not b!1114948) (not b!1114940) (not b!1114947) tp_is_empty!27831 (not b!1114944) (not mapNonEmpty!43564) (not b!1114941) (not b!1114946) (not start!97600))
(check-sat)
