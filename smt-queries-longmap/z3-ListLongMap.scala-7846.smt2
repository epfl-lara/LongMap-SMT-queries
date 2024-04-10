; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97822 () Bool)

(assert start!97822)

(declare-fun b_free!23523 () Bool)

(declare-fun b_next!23523 () Bool)

(assert (=> start!97822 (= b_free!23523 (not b_next!23523))))

(declare-fun tp!83272 () Bool)

(declare-fun b_and!37829 () Bool)

(assert (=> start!97822 (= tp!83272 b_and!37829)))

(declare-fun b!1119430 () Bool)

(declare-fun res!747744 () Bool)

(declare-fun e!637527 () Bool)

(assert (=> b!1119430 (=> (not res!747744) (not e!637527))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!72991 0))(
  ( (array!72992 (arr!35148 (Array (_ BitVec 32) (_ BitVec 64))) (size!35684 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72991)

(assert (=> b!1119430 (= res!747744 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35684 _keys!1208))))))

(declare-fun b!1119431 () Bool)

(declare-fun res!747748 () Bool)

(assert (=> b!1119431 (=> (not res!747748) (not e!637527))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1119431 (= res!747748 (validKeyInArray!0 k0!934))))

(declare-fun b!1119432 () Bool)

(declare-fun e!637532 () Bool)

(declare-fun tp_is_empty!28053 () Bool)

(assert (=> b!1119432 (= e!637532 tp_is_empty!28053)))

(declare-fun mapIsEmpty!43897 () Bool)

(declare-fun mapRes!43897 () Bool)

(assert (=> mapIsEmpty!43897 mapRes!43897))

(declare-fun b!1119433 () Bool)

(declare-fun e!637531 () Bool)

(assert (=> b!1119433 (= e!637531 tp_is_empty!28053)))

(declare-fun b!1119434 () Bool)

(declare-fun res!747751 () Bool)

(assert (=> b!1119434 (=> (not res!747751) (not e!637527))))

(assert (=> b!1119434 (= res!747751 (= (select (arr!35148 _keys!1208) i!673) k0!934))))

(declare-fun b!1119435 () Bool)

(declare-fun res!747747 () Bool)

(assert (=> b!1119435 (=> (not res!747747) (not e!637527))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72991 (_ BitVec 32)) Bool)

(assert (=> b!1119435 (= res!747747 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!747753 () Bool)

(assert (=> start!97822 (=> (not res!747753) (not e!637527))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97822 (= res!747753 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35684 _keys!1208))))))

(assert (=> start!97822 e!637527))

(assert (=> start!97822 tp_is_empty!28053))

(declare-fun array_inv!27004 (array!72991) Bool)

(assert (=> start!97822 (array_inv!27004 _keys!1208)))

(assert (=> start!97822 true))

(assert (=> start!97822 tp!83272))

(declare-datatypes ((V!42531 0))(
  ( (V!42532 (val!14083 Int)) )
))
(declare-datatypes ((ValueCell!13317 0))(
  ( (ValueCellFull!13317 (v!16716 V!42531)) (EmptyCell!13317) )
))
(declare-datatypes ((array!72993 0))(
  ( (array!72994 (arr!35149 (Array (_ BitVec 32) ValueCell!13317)) (size!35685 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72993)

(declare-fun e!637530 () Bool)

(declare-fun array_inv!27005 (array!72993) Bool)

(assert (=> start!97822 (and (array_inv!27005 _values!996) e!637530)))

(declare-fun b!1119436 () Bool)

(declare-fun res!747750 () Bool)

(declare-fun e!637533 () Bool)

(assert (=> b!1119436 (=> (not res!747750) (not e!637533))))

(declare-fun lt!497750 () array!72991)

(declare-datatypes ((List!24452 0))(
  ( (Nil!24449) (Cons!24448 (h!25657 (_ BitVec 64)) (t!34967 List!24452)) )
))
(declare-fun arrayNoDuplicates!0 (array!72991 (_ BitVec 32) List!24452) Bool)

(assert (=> b!1119436 (= res!747750 (arrayNoDuplicates!0 lt!497750 #b00000000000000000000000000000000 Nil!24449))))

(declare-fun b!1119437 () Bool)

(declare-fun e!637528 () Bool)

(assert (=> b!1119437 (= e!637528 true)))

(declare-fun zeroValue!944 () V!42531)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42531)

(declare-datatypes ((tuple2!17668 0))(
  ( (tuple2!17669 (_1!8845 (_ BitVec 64)) (_2!8845 V!42531)) )
))
(declare-datatypes ((List!24453 0))(
  ( (Nil!24450) (Cons!24449 (h!25658 tuple2!17668) (t!34968 List!24453)) )
))
(declare-datatypes ((ListLongMap!15637 0))(
  ( (ListLongMap!15638 (toList!7834 List!24453)) )
))
(declare-fun lt!497753 () ListLongMap!15637)

(declare-fun getCurrentListMapNoExtraKeys!4324 (array!72991 array!72993 (_ BitVec 32) (_ BitVec 32) V!42531 V!42531 (_ BitVec 32) Int) ListLongMap!15637)

(declare-fun dynLambda!2428 (Int (_ BitVec 64)) V!42531)

(assert (=> b!1119437 (= lt!497753 (getCurrentListMapNoExtraKeys!4324 lt!497750 (array!72994 (store (arr!35149 _values!996) i!673 (ValueCellFull!13317 (dynLambda!2428 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35685 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!497751 () ListLongMap!15637)

(assert (=> b!1119437 (= lt!497751 (getCurrentListMapNoExtraKeys!4324 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1119438 () Bool)

(declare-fun res!747752 () Bool)

(assert (=> b!1119438 (=> (not res!747752) (not e!637527))))

(assert (=> b!1119438 (= res!747752 (and (= (size!35685 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35684 _keys!1208) (size!35685 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1119439 () Bool)

(declare-fun res!747754 () Bool)

(assert (=> b!1119439 (=> (not res!747754) (not e!637527))))

(assert (=> b!1119439 (= res!747754 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24449))))

(declare-fun b!1119440 () Bool)

(assert (=> b!1119440 (= e!637527 e!637533)))

(declare-fun res!747749 () Bool)

(assert (=> b!1119440 (=> (not res!747749) (not e!637533))))

(assert (=> b!1119440 (= res!747749 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497750 mask!1564))))

(assert (=> b!1119440 (= lt!497750 (array!72992 (store (arr!35148 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35684 _keys!1208)))))

(declare-fun mapNonEmpty!43897 () Bool)

(declare-fun tp!83273 () Bool)

(assert (=> mapNonEmpty!43897 (= mapRes!43897 (and tp!83273 e!637531))))

(declare-fun mapKey!43897 () (_ BitVec 32))

(declare-fun mapValue!43897 () ValueCell!13317)

(declare-fun mapRest!43897 () (Array (_ BitVec 32) ValueCell!13317))

(assert (=> mapNonEmpty!43897 (= (arr!35149 _values!996) (store mapRest!43897 mapKey!43897 mapValue!43897))))

(declare-fun b!1119441 () Bool)

(assert (=> b!1119441 (= e!637530 (and e!637532 mapRes!43897))))

(declare-fun condMapEmpty!43897 () Bool)

(declare-fun mapDefault!43897 () ValueCell!13317)

(assert (=> b!1119441 (= condMapEmpty!43897 (= (arr!35149 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13317)) mapDefault!43897)))))

(declare-fun b!1119442 () Bool)

(declare-fun res!747746 () Bool)

(assert (=> b!1119442 (=> (not res!747746) (not e!637527))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1119442 (= res!747746 (validMask!0 mask!1564))))

(declare-fun b!1119443 () Bool)

(assert (=> b!1119443 (= e!637533 (not e!637528))))

(declare-fun res!747745 () Bool)

(assert (=> b!1119443 (=> res!747745 e!637528)))

(assert (=> b!1119443 (= res!747745 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!72991 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1119443 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36738 0))(
  ( (Unit!36739) )
))
(declare-fun lt!497752 () Unit!36738)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72991 (_ BitVec 64) (_ BitVec 32)) Unit!36738)

(assert (=> b!1119443 (= lt!497752 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!97822 res!747753) b!1119442))

(assert (= (and b!1119442 res!747746) b!1119438))

(assert (= (and b!1119438 res!747752) b!1119435))

(assert (= (and b!1119435 res!747747) b!1119439))

(assert (= (and b!1119439 res!747754) b!1119430))

(assert (= (and b!1119430 res!747744) b!1119431))

(assert (= (and b!1119431 res!747748) b!1119434))

(assert (= (and b!1119434 res!747751) b!1119440))

(assert (= (and b!1119440 res!747749) b!1119436))

(assert (= (and b!1119436 res!747750) b!1119443))

(assert (= (and b!1119443 (not res!747745)) b!1119437))

(assert (= (and b!1119441 condMapEmpty!43897) mapIsEmpty!43897))

(assert (= (and b!1119441 (not condMapEmpty!43897)) mapNonEmpty!43897))

(get-info :version)

(assert (= (and mapNonEmpty!43897 ((_ is ValueCellFull!13317) mapValue!43897)) b!1119433))

(assert (= (and b!1119441 ((_ is ValueCellFull!13317) mapDefault!43897)) b!1119432))

(assert (= start!97822 b!1119441))

(declare-fun b_lambda!18493 () Bool)

(assert (=> (not b_lambda!18493) (not b!1119437)))

(declare-fun t!34966 () Bool)

(declare-fun tb!8335 () Bool)

(assert (=> (and start!97822 (= defaultEntry!1004 defaultEntry!1004) t!34966) tb!8335))

(declare-fun result!17231 () Bool)

(assert (=> tb!8335 (= result!17231 tp_is_empty!28053)))

(assert (=> b!1119437 t!34966))

(declare-fun b_and!37831 () Bool)

(assert (= b_and!37829 (and (=> t!34966 result!17231) b_and!37831)))

(declare-fun m!1034715 () Bool)

(assert (=> b!1119431 m!1034715))

(declare-fun m!1034717 () Bool)

(assert (=> b!1119437 m!1034717))

(declare-fun m!1034719 () Bool)

(assert (=> b!1119437 m!1034719))

(declare-fun m!1034721 () Bool)

(assert (=> b!1119437 m!1034721))

(declare-fun m!1034723 () Bool)

(assert (=> b!1119437 m!1034723))

(declare-fun m!1034725 () Bool)

(assert (=> b!1119442 m!1034725))

(declare-fun m!1034727 () Bool)

(assert (=> start!97822 m!1034727))

(declare-fun m!1034729 () Bool)

(assert (=> start!97822 m!1034729))

(declare-fun m!1034731 () Bool)

(assert (=> mapNonEmpty!43897 m!1034731))

(declare-fun m!1034733 () Bool)

(assert (=> b!1119439 m!1034733))

(declare-fun m!1034735 () Bool)

(assert (=> b!1119434 m!1034735))

(declare-fun m!1034737 () Bool)

(assert (=> b!1119435 m!1034737))

(declare-fun m!1034739 () Bool)

(assert (=> b!1119443 m!1034739))

(declare-fun m!1034741 () Bool)

(assert (=> b!1119443 m!1034741))

(declare-fun m!1034743 () Bool)

(assert (=> b!1119440 m!1034743))

(declare-fun m!1034745 () Bool)

(assert (=> b!1119440 m!1034745))

(declare-fun m!1034747 () Bool)

(assert (=> b!1119436 m!1034747))

(check-sat (not start!97822) (not b_next!23523) (not b!1119440) (not b!1119442) (not b_lambda!18493) (not b!1119435) b_and!37831 (not b!1119431) (not mapNonEmpty!43897) tp_is_empty!28053 (not b!1119443) (not b!1119436) (not b!1119437) (not b!1119439))
(check-sat b_and!37831 (not b_next!23523))
