; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97742 () Bool)

(assert start!97742)

(declare-fun b_free!23449 () Bool)

(declare-fun b_next!23449 () Bool)

(assert (=> start!97742 (= b_free!23449 (not b_next!23449))))

(declare-fun tp!83050 () Bool)

(declare-fun b_and!37701 () Bool)

(assert (=> start!97742 (= tp!83050 b_and!37701)))

(declare-fun b!1117715 () Bool)

(declare-fun res!746461 () Bool)

(declare-fun e!636670 () Bool)

(assert (=> b!1117715 (=> (not res!746461) (not e!636670))))

(declare-datatypes ((array!72752 0))(
  ( (array!72753 (arr!35029 (Array (_ BitVec 32) (_ BitVec 64))) (size!35567 (_ BitVec 32))) )
))
(declare-fun lt!497167 () array!72752)

(declare-datatypes ((List!24439 0))(
  ( (Nil!24436) (Cons!24435 (h!25644 (_ BitVec 64)) (t!34911 List!24439)) )
))
(declare-fun arrayNoDuplicates!0 (array!72752 (_ BitVec 32) List!24439) Bool)

(assert (=> b!1117715 (= res!746461 (arrayNoDuplicates!0 lt!497167 #b00000000000000000000000000000000 Nil!24436))))

(declare-fun mapIsEmpty!43786 () Bool)

(declare-fun mapRes!43786 () Bool)

(assert (=> mapIsEmpty!43786 mapRes!43786))

(declare-fun b!1117716 () Bool)

(declare-fun res!746464 () Bool)

(declare-fun e!636674 () Bool)

(assert (=> b!1117716 (=> (not res!746464) (not e!636674))))

(declare-fun _keys!1208 () array!72752)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72752 (_ BitVec 32)) Bool)

(assert (=> b!1117716 (= res!746464 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1117717 () Bool)

(declare-fun res!746458 () Bool)

(assert (=> b!1117717 (=> (not res!746458) (not e!636674))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1117717 (= res!746458 (validKeyInArray!0 k0!934))))

(declare-fun b!1117718 () Bool)

(declare-fun e!636672 () Bool)

(declare-fun tp_is_empty!27979 () Bool)

(assert (=> b!1117718 (= e!636672 tp_is_empty!27979)))

(declare-fun b!1117719 () Bool)

(declare-fun res!746463 () Bool)

(assert (=> b!1117719 (=> (not res!746463) (not e!636674))))

(assert (=> b!1117719 (= res!746463 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24436))))

(declare-fun res!746456 () Bool)

(assert (=> start!97742 (=> (not res!746456) (not e!636674))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97742 (= res!746456 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35567 _keys!1208))))))

(assert (=> start!97742 e!636674))

(assert (=> start!97742 tp_is_empty!27979))

(declare-fun array_inv!26988 (array!72752) Bool)

(assert (=> start!97742 (array_inv!26988 _keys!1208)))

(assert (=> start!97742 true))

(assert (=> start!97742 tp!83050))

(declare-datatypes ((V!42433 0))(
  ( (V!42434 (val!14046 Int)) )
))
(declare-datatypes ((ValueCell!13280 0))(
  ( (ValueCellFull!13280 (v!16678 V!42433)) (EmptyCell!13280) )
))
(declare-datatypes ((array!72754 0))(
  ( (array!72755 (arr!35030 (Array (_ BitVec 32) ValueCell!13280)) (size!35568 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72754)

(declare-fun e!636673 () Bool)

(declare-fun array_inv!26989 (array!72754) Bool)

(assert (=> start!97742 (and (array_inv!26989 _values!996) e!636673)))

(declare-fun mapNonEmpty!43786 () Bool)

(declare-fun tp!83051 () Bool)

(declare-fun e!636671 () Bool)

(assert (=> mapNonEmpty!43786 (= mapRes!43786 (and tp!83051 e!636671))))

(declare-fun mapValue!43786 () ValueCell!13280)

(declare-fun mapKey!43786 () (_ BitVec 32))

(declare-fun mapRest!43786 () (Array (_ BitVec 32) ValueCell!13280))

(assert (=> mapNonEmpty!43786 (= (arr!35030 _values!996) (store mapRest!43786 mapKey!43786 mapValue!43786))))

(declare-fun b!1117720 () Bool)

(assert (=> b!1117720 (= e!636671 tp_is_empty!27979)))

(declare-fun b!1117721 () Bool)

(declare-fun res!746454 () Bool)

(assert (=> b!1117721 (=> (not res!746454) (not e!636674))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1117721 (= res!746454 (and (= (size!35568 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35567 _keys!1208) (size!35568 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1117722 () Bool)

(declare-fun res!746459 () Bool)

(assert (=> b!1117722 (=> (not res!746459) (not e!636674))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1117722 (= res!746459 (validMask!0 mask!1564))))

(declare-fun b!1117723 () Bool)

(declare-fun res!746455 () Bool)

(assert (=> b!1117723 (=> (not res!746455) (not e!636674))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1117723 (= res!746455 (= (select (arr!35029 _keys!1208) i!673) k0!934))))

(declare-fun b!1117724 () Bool)

(declare-fun e!636669 () Bool)

(assert (=> b!1117724 (= e!636669 true)))

(declare-fun zeroValue!944 () V!42433)

(declare-datatypes ((tuple2!17680 0))(
  ( (tuple2!17681 (_1!8851 (_ BitVec 64)) (_2!8851 V!42433)) )
))
(declare-datatypes ((List!24440 0))(
  ( (Nil!24437) (Cons!24436 (h!25645 tuple2!17680) (t!34912 List!24440)) )
))
(declare-datatypes ((ListLongMap!15649 0))(
  ( (ListLongMap!15650 (toList!7840 List!24440)) )
))
(declare-fun lt!497169 () ListLongMap!15649)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42433)

(declare-fun getCurrentListMapNoExtraKeys!4349 (array!72752 array!72754 (_ BitVec 32) (_ BitVec 32) V!42433 V!42433 (_ BitVec 32) Int) ListLongMap!15649)

(assert (=> b!1117724 (= lt!497169 (getCurrentListMapNoExtraKeys!4349 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1117725 () Bool)

(assert (=> b!1117725 (= e!636673 (and e!636672 mapRes!43786))))

(declare-fun condMapEmpty!43786 () Bool)

(declare-fun mapDefault!43786 () ValueCell!13280)

(assert (=> b!1117725 (= condMapEmpty!43786 (= (arr!35030 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13280)) mapDefault!43786)))))

(declare-fun b!1117726 () Bool)

(assert (=> b!1117726 (= e!636670 (not e!636669))))

(declare-fun res!746457 () Bool)

(assert (=> b!1117726 (=> res!746457 e!636669)))

(assert (=> b!1117726 (= res!746457 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!72752 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1117726 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36511 0))(
  ( (Unit!36512) )
))
(declare-fun lt!497168 () Unit!36511)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72752 (_ BitVec 64) (_ BitVec 32)) Unit!36511)

(assert (=> b!1117726 (= lt!497168 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1117727 () Bool)

(declare-fun res!746460 () Bool)

(assert (=> b!1117727 (=> (not res!746460) (not e!636674))))

(assert (=> b!1117727 (= res!746460 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35567 _keys!1208))))))

(declare-fun b!1117728 () Bool)

(assert (=> b!1117728 (= e!636674 e!636670)))

(declare-fun res!746462 () Bool)

(assert (=> b!1117728 (=> (not res!746462) (not e!636670))))

(assert (=> b!1117728 (= res!746462 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497167 mask!1564))))

(assert (=> b!1117728 (= lt!497167 (array!72753 (store (arr!35029 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35567 _keys!1208)))))

(assert (= (and start!97742 res!746456) b!1117722))

(assert (= (and b!1117722 res!746459) b!1117721))

(assert (= (and b!1117721 res!746454) b!1117716))

(assert (= (and b!1117716 res!746464) b!1117719))

(assert (= (and b!1117719 res!746463) b!1117727))

(assert (= (and b!1117727 res!746460) b!1117717))

(assert (= (and b!1117717 res!746458) b!1117723))

(assert (= (and b!1117723 res!746455) b!1117728))

(assert (= (and b!1117728 res!746462) b!1117715))

(assert (= (and b!1117715 res!746461) b!1117726))

(assert (= (and b!1117726 (not res!746457)) b!1117724))

(assert (= (and b!1117725 condMapEmpty!43786) mapIsEmpty!43786))

(assert (= (and b!1117725 (not condMapEmpty!43786)) mapNonEmpty!43786))

(get-info :version)

(assert (= (and mapNonEmpty!43786 ((_ is ValueCellFull!13280) mapValue!43786)) b!1117720))

(assert (= (and b!1117725 ((_ is ValueCellFull!13280) mapDefault!43786)) b!1117718))

(assert (= start!97742 b!1117725))

(declare-fun m!1032957 () Bool)

(assert (=> mapNonEmpty!43786 m!1032957))

(declare-fun m!1032959 () Bool)

(assert (=> b!1117715 m!1032959))

(declare-fun m!1032961 () Bool)

(assert (=> b!1117723 m!1032961))

(declare-fun m!1032963 () Bool)

(assert (=> b!1117716 m!1032963))

(declare-fun m!1032965 () Bool)

(assert (=> b!1117719 m!1032965))

(declare-fun m!1032967 () Bool)

(assert (=> b!1117717 m!1032967))

(declare-fun m!1032969 () Bool)

(assert (=> b!1117728 m!1032969))

(declare-fun m!1032971 () Bool)

(assert (=> b!1117728 m!1032971))

(declare-fun m!1032973 () Bool)

(assert (=> b!1117726 m!1032973))

(declare-fun m!1032975 () Bool)

(assert (=> b!1117726 m!1032975))

(declare-fun m!1032977 () Bool)

(assert (=> start!97742 m!1032977))

(declare-fun m!1032979 () Bool)

(assert (=> start!97742 m!1032979))

(declare-fun m!1032981 () Bool)

(assert (=> b!1117722 m!1032981))

(declare-fun m!1032983 () Bool)

(assert (=> b!1117724 m!1032983))

(check-sat (not b!1117728) b_and!37701 (not b!1117724) (not b!1117726) (not b!1117722) (not start!97742) (not b!1117719) (not b_next!23449) tp_is_empty!27979 (not b!1117716) (not b!1117717) (not b!1117715) (not mapNonEmpty!43786))
(check-sat b_and!37701 (not b_next!23449))
