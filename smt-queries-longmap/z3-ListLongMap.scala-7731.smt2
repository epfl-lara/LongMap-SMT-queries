; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97116 () Bool)

(assert start!97116)

(declare-fun b!1104560 () Bool)

(declare-fun res!736939 () Bool)

(declare-fun e!630481 () Bool)

(assert (=> b!1104560 (=> (not res!736939) (not e!630481))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1104560 (= res!736939 (validKeyInArray!0 k0!934))))

(declare-fun b!1104561 () Bool)

(declare-fun res!736936 () Bool)

(assert (=> b!1104561 (=> (not res!736936) (not e!630481))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1104561 (= res!736936 (validMask!0 mask!1564))))

(declare-fun b!1104562 () Bool)

(declare-fun res!736942 () Bool)

(assert (=> b!1104562 (=> (not res!736942) (not e!630481))))

(declare-datatypes ((array!71651 0))(
  ( (array!71652 (arr!34479 (Array (_ BitVec 32) (_ BitVec 64))) (size!35015 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71651)

(declare-datatypes ((List!24060 0))(
  ( (Nil!24057) (Cons!24056 (h!25265 (_ BitVec 64)) (t!34325 List!24060)) )
))
(declare-fun arrayNoDuplicates!0 (array!71651 (_ BitVec 32) List!24060) Bool)

(assert (=> b!1104562 (= res!736942 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24057))))

(declare-fun b!1104563 () Bool)

(declare-fun res!736943 () Bool)

(assert (=> b!1104563 (=> (not res!736943) (not e!630481))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!41611 0))(
  ( (V!41612 (val!13738 Int)) )
))
(declare-datatypes ((ValueCell!12972 0))(
  ( (ValueCellFull!12972 (v!16371 V!41611)) (EmptyCell!12972) )
))
(declare-datatypes ((array!71653 0))(
  ( (array!71654 (arr!34480 (Array (_ BitVec 32) ValueCell!12972)) (size!35016 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71653)

(assert (=> b!1104563 (= res!736943 (and (= (size!35016 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35015 _keys!1208) (size!35016 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1104564 () Bool)

(declare-fun res!736935 () Bool)

(assert (=> b!1104564 (=> (not res!736935) (not e!630481))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71651 (_ BitVec 32)) Bool)

(assert (=> b!1104564 (= res!736935 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1104565 () Bool)

(declare-fun e!630483 () Bool)

(assert (=> b!1104565 (= e!630483 false)))

(declare-fun lt!495160 () Bool)

(declare-fun lt!495161 () array!71651)

(assert (=> b!1104565 (= lt!495160 (arrayNoDuplicates!0 lt!495161 #b00000000000000000000000000000000 Nil!24057))))

(declare-fun b!1104566 () Bool)

(declare-fun res!736937 () Bool)

(assert (=> b!1104566 (=> (not res!736937) (not e!630481))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1104566 (= res!736937 (= (select (arr!34479 _keys!1208) i!673) k0!934))))

(declare-fun res!736941 () Bool)

(assert (=> start!97116 (=> (not res!736941) (not e!630481))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97116 (= res!736941 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35015 _keys!1208))))))

(assert (=> start!97116 e!630481))

(declare-fun array_inv!26544 (array!71651) Bool)

(assert (=> start!97116 (array_inv!26544 _keys!1208)))

(assert (=> start!97116 true))

(declare-fun e!630482 () Bool)

(declare-fun array_inv!26545 (array!71653) Bool)

(assert (=> start!97116 (and (array_inv!26545 _values!996) e!630482)))

(declare-fun mapNonEmpty!42859 () Bool)

(declare-fun mapRes!42859 () Bool)

(declare-fun tp!81779 () Bool)

(declare-fun e!630484 () Bool)

(assert (=> mapNonEmpty!42859 (= mapRes!42859 (and tp!81779 e!630484))))

(declare-fun mapValue!42859 () ValueCell!12972)

(declare-fun mapKey!42859 () (_ BitVec 32))

(declare-fun mapRest!42859 () (Array (_ BitVec 32) ValueCell!12972))

(assert (=> mapNonEmpty!42859 (= (arr!34480 _values!996) (store mapRest!42859 mapKey!42859 mapValue!42859))))

(declare-fun b!1104567 () Bool)

(declare-fun e!630480 () Bool)

(assert (=> b!1104567 (= e!630482 (and e!630480 mapRes!42859))))

(declare-fun condMapEmpty!42859 () Bool)

(declare-fun mapDefault!42859 () ValueCell!12972)

(assert (=> b!1104567 (= condMapEmpty!42859 (= (arr!34480 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12972)) mapDefault!42859)))))

(declare-fun b!1104568 () Bool)

(declare-fun tp_is_empty!27363 () Bool)

(assert (=> b!1104568 (= e!630484 tp_is_empty!27363)))

(declare-fun b!1104569 () Bool)

(declare-fun res!736940 () Bool)

(assert (=> b!1104569 (=> (not res!736940) (not e!630481))))

(assert (=> b!1104569 (= res!736940 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35015 _keys!1208))))))

(declare-fun b!1104570 () Bool)

(assert (=> b!1104570 (= e!630481 e!630483)))

(declare-fun res!736938 () Bool)

(assert (=> b!1104570 (=> (not res!736938) (not e!630483))))

(assert (=> b!1104570 (= res!736938 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495161 mask!1564))))

(assert (=> b!1104570 (= lt!495161 (array!71652 (store (arr!34479 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35015 _keys!1208)))))

(declare-fun b!1104571 () Bool)

(assert (=> b!1104571 (= e!630480 tp_is_empty!27363)))

(declare-fun mapIsEmpty!42859 () Bool)

(assert (=> mapIsEmpty!42859 mapRes!42859))

(assert (= (and start!97116 res!736941) b!1104561))

(assert (= (and b!1104561 res!736936) b!1104563))

(assert (= (and b!1104563 res!736943) b!1104564))

(assert (= (and b!1104564 res!736935) b!1104562))

(assert (= (and b!1104562 res!736942) b!1104569))

(assert (= (and b!1104569 res!736940) b!1104560))

(assert (= (and b!1104560 res!736939) b!1104566))

(assert (= (and b!1104566 res!736937) b!1104570))

(assert (= (and b!1104570 res!736938) b!1104565))

(assert (= (and b!1104567 condMapEmpty!42859) mapIsEmpty!42859))

(assert (= (and b!1104567 (not condMapEmpty!42859)) mapNonEmpty!42859))

(get-info :version)

(assert (= (and mapNonEmpty!42859 ((_ is ValueCellFull!12972) mapValue!42859)) b!1104568))

(assert (= (and b!1104567 ((_ is ValueCellFull!12972) mapDefault!42859)) b!1104571))

(assert (= start!97116 b!1104567))

(declare-fun m!1024261 () Bool)

(assert (=> b!1104561 m!1024261))

(declare-fun m!1024263 () Bool)

(assert (=> start!97116 m!1024263))

(declare-fun m!1024265 () Bool)

(assert (=> start!97116 m!1024265))

(declare-fun m!1024267 () Bool)

(assert (=> b!1104570 m!1024267))

(declare-fun m!1024269 () Bool)

(assert (=> b!1104570 m!1024269))

(declare-fun m!1024271 () Bool)

(assert (=> b!1104562 m!1024271))

(declare-fun m!1024273 () Bool)

(assert (=> b!1104566 m!1024273))

(declare-fun m!1024275 () Bool)

(assert (=> b!1104564 m!1024275))

(declare-fun m!1024277 () Bool)

(assert (=> mapNonEmpty!42859 m!1024277))

(declare-fun m!1024279 () Bool)

(assert (=> b!1104560 m!1024279))

(declare-fun m!1024281 () Bool)

(assert (=> b!1104565 m!1024281))

(check-sat (not mapNonEmpty!42859) (not b!1104560) tp_is_empty!27363 (not b!1104565) (not b!1104564) (not b!1104561) (not b!1104562) (not b!1104570) (not start!97116))
(check-sat)
