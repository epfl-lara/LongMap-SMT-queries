; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100460 () Bool)

(assert start!100460)

(declare-fun b_free!25789 () Bool)

(declare-fun b_next!25789 () Bool)

(assert (=> start!100460 (= b_free!25789 (not b_next!25789))))

(declare-fun tp!90356 () Bool)

(declare-fun b_and!42443 () Bool)

(assert (=> start!100460 (= tp!90356 b_and!42443)))

(declare-fun mapNonEmpty!47582 () Bool)

(declare-fun mapRes!47582 () Bool)

(declare-fun tp!90357 () Bool)

(declare-fun e!681325 () Bool)

(assert (=> mapNonEmpty!47582 (= mapRes!47582 (and tp!90357 e!681325))))

(declare-datatypes ((V!45785 0))(
  ( (V!45786 (val!15303 Int)) )
))
(declare-datatypes ((ValueCell!14537 0))(
  ( (ValueCellFull!14537 (v!17940 V!45785)) (EmptyCell!14537) )
))
(declare-fun mapRest!47582 () (Array (_ BitVec 32) ValueCell!14537))

(declare-datatypes ((array!77688 0))(
  ( (array!77689 (arr!37489 (Array (_ BitVec 32) ValueCell!14537)) (size!38027 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77688)

(declare-fun mapValue!47582 () ValueCell!14537)

(declare-fun mapKey!47582 () (_ BitVec 32))

(assert (=> mapNonEmpty!47582 (= (arr!37489 _values!996) (store mapRest!47582 mapKey!47582 mapValue!47582))))

(declare-fun b!1199636 () Bool)

(declare-fun res!798538 () Bool)

(declare-fun e!681323 () Bool)

(assert (=> b!1199636 (=> (not res!798538) (not e!681323))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1199636 (= res!798538 (validMask!0 mask!1564))))

(declare-fun b!1199637 () Bool)

(declare-fun res!798540 () Bool)

(declare-fun e!681319 () Bool)

(assert (=> b!1199637 (=> (not res!798540) (not e!681319))))

(declare-datatypes ((array!77690 0))(
  ( (array!77691 (arr!37490 (Array (_ BitVec 32) (_ BitVec 64))) (size!38028 (_ BitVec 32))) )
))
(declare-fun lt!543664 () array!77690)

(declare-datatypes ((List!26469 0))(
  ( (Nil!26466) (Cons!26465 (h!27674 (_ BitVec 64)) (t!39229 List!26469)) )
))
(declare-fun arrayNoDuplicates!0 (array!77690 (_ BitVec 32) List!26469) Bool)

(assert (=> b!1199637 (= res!798540 (arrayNoDuplicates!0 lt!543664 #b00000000000000000000000000000000 Nil!26466))))

(declare-fun b!1199638 () Bool)

(declare-fun res!798537 () Bool)

(assert (=> b!1199638 (=> (not res!798537) (not e!681323))))

(declare-fun _keys!1208 () array!77690)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77690 (_ BitVec 32)) Bool)

(assert (=> b!1199638 (= res!798537 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1199639 () Bool)

(assert (=> b!1199639 (= e!681323 e!681319)))

(declare-fun res!798533 () Bool)

(assert (=> b!1199639 (=> (not res!798533) (not e!681319))))

(assert (=> b!1199639 (= res!798533 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543664 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1199639 (= lt!543664 (array!77691 (store (arr!37490 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38028 _keys!1208)))))

(declare-fun res!798539 () Bool)

(assert (=> start!100460 (=> (not res!798539) (not e!681323))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100460 (= res!798539 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38028 _keys!1208))))))

(assert (=> start!100460 e!681323))

(declare-fun tp_is_empty!30493 () Bool)

(assert (=> start!100460 tp_is_empty!30493))

(declare-fun array_inv!28686 (array!77690) Bool)

(assert (=> start!100460 (array_inv!28686 _keys!1208)))

(assert (=> start!100460 true))

(assert (=> start!100460 tp!90356))

(declare-fun e!681321 () Bool)

(declare-fun array_inv!28687 (array!77688) Bool)

(assert (=> start!100460 (and (array_inv!28687 _values!996) e!681321)))

(declare-fun b!1199640 () Bool)

(declare-fun res!798530 () Bool)

(assert (=> b!1199640 (=> (not res!798530) (not e!681323))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1199640 (= res!798530 (validKeyInArray!0 k0!934))))

(declare-fun b!1199641 () Bool)

(declare-fun res!798536 () Bool)

(assert (=> b!1199641 (=> (not res!798536) (not e!681323))))

(assert (=> b!1199641 (= res!798536 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26466))))

(declare-fun b!1199642 () Bool)

(declare-fun e!681322 () Bool)

(assert (=> b!1199642 (= e!681321 (and e!681322 mapRes!47582))))

(declare-fun condMapEmpty!47582 () Bool)

(declare-fun mapDefault!47582 () ValueCell!14537)

(assert (=> b!1199642 (= condMapEmpty!47582 (= (arr!37489 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14537)) mapDefault!47582)))))

(declare-fun b!1199643 () Bool)

(declare-fun res!798535 () Bool)

(assert (=> b!1199643 (=> (not res!798535) (not e!681323))))

(assert (=> b!1199643 (= res!798535 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38028 _keys!1208))))))

(declare-fun b!1199644 () Bool)

(assert (=> b!1199644 (= e!681322 tp_is_empty!30493)))

(declare-fun mapIsEmpty!47582 () Bool)

(assert (=> mapIsEmpty!47582 mapRes!47582))

(declare-fun b!1199645 () Bool)

(declare-fun res!798531 () Bool)

(assert (=> b!1199645 (=> (not res!798531) (not e!681323))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1199645 (= res!798531 (and (= (size!38027 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38028 _keys!1208) (size!38027 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1199646 () Bool)

(declare-fun res!798532 () Bool)

(assert (=> b!1199646 (=> (not res!798532) (not e!681323))))

(assert (=> b!1199646 (= res!798532 (= (select (arr!37490 _keys!1208) i!673) k0!934))))

(declare-fun b!1199647 () Bool)

(assert (=> b!1199647 (= e!681325 tp_is_empty!30493)))

(declare-fun b!1199648 () Bool)

(declare-fun e!681320 () Bool)

(assert (=> b!1199648 (= e!681320 true)))

(declare-fun zeroValue!944 () V!45785)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19680 0))(
  ( (tuple2!19681 (_1!9851 (_ BitVec 64)) (_2!9851 V!45785)) )
))
(declare-datatypes ((List!26470 0))(
  ( (Nil!26467) (Cons!26466 (h!27675 tuple2!19680) (t!39230 List!26470)) )
))
(declare-datatypes ((ListLongMap!17649 0))(
  ( (ListLongMap!17650 (toList!8840 List!26470)) )
))
(declare-fun lt!543665 () ListLongMap!17649)

(declare-fun minValue!944 () V!45785)

(declare-fun getCurrentListMapNoExtraKeys!5289 (array!77690 array!77688 (_ BitVec 32) (_ BitVec 32) V!45785 V!45785 (_ BitVec 32) Int) ListLongMap!17649)

(declare-fun dynLambda!3169 (Int (_ BitVec 64)) V!45785)

(assert (=> b!1199648 (= lt!543665 (getCurrentListMapNoExtraKeys!5289 lt!543664 (array!77689 (store (arr!37489 _values!996) i!673 (ValueCellFull!14537 (dynLambda!3169 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38027 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!543667 () ListLongMap!17649)

(assert (=> b!1199648 (= lt!543667 (getCurrentListMapNoExtraKeys!5289 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1199649 () Bool)

(assert (=> b!1199649 (= e!681319 (not e!681320))))

(declare-fun res!798534 () Bool)

(assert (=> b!1199649 (=> res!798534 e!681320)))

(assert (=> b!1199649 (= res!798534 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77690 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1199649 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39635 0))(
  ( (Unit!39636) )
))
(declare-fun lt!543666 () Unit!39635)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77690 (_ BitVec 64) (_ BitVec 32)) Unit!39635)

(assert (=> b!1199649 (= lt!543666 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!100460 res!798539) b!1199636))

(assert (= (and b!1199636 res!798538) b!1199645))

(assert (= (and b!1199645 res!798531) b!1199638))

(assert (= (and b!1199638 res!798537) b!1199641))

(assert (= (and b!1199641 res!798536) b!1199643))

(assert (= (and b!1199643 res!798535) b!1199640))

(assert (= (and b!1199640 res!798530) b!1199646))

(assert (= (and b!1199646 res!798532) b!1199639))

(assert (= (and b!1199639 res!798533) b!1199637))

(assert (= (and b!1199637 res!798540) b!1199649))

(assert (= (and b!1199649 (not res!798534)) b!1199648))

(assert (= (and b!1199642 condMapEmpty!47582) mapIsEmpty!47582))

(assert (= (and b!1199642 (not condMapEmpty!47582)) mapNonEmpty!47582))

(get-info :version)

(assert (= (and mapNonEmpty!47582 ((_ is ValueCellFull!14537) mapValue!47582)) b!1199647))

(assert (= (and b!1199642 ((_ is ValueCellFull!14537) mapDefault!47582)) b!1199644))

(assert (= start!100460 b!1199642))

(declare-fun b_lambda!20967 () Bool)

(assert (=> (not b_lambda!20967) (not b!1199648)))

(declare-fun t!39228 () Bool)

(declare-fun tb!10581 () Bool)

(assert (=> (and start!100460 (= defaultEntry!1004 defaultEntry!1004) t!39228) tb!10581))

(declare-fun result!21747 () Bool)

(assert (=> tb!10581 (= result!21747 tp_is_empty!30493)))

(assert (=> b!1199648 t!39228))

(declare-fun b_and!42445 () Bool)

(assert (= b_and!42443 (and (=> t!39228 result!21747) b_and!42445)))

(declare-fun m!1105615 () Bool)

(assert (=> b!1199639 m!1105615))

(declare-fun m!1105617 () Bool)

(assert (=> b!1199639 m!1105617))

(declare-fun m!1105619 () Bool)

(assert (=> mapNonEmpty!47582 m!1105619))

(declare-fun m!1105621 () Bool)

(assert (=> b!1199646 m!1105621))

(declare-fun m!1105623 () Bool)

(assert (=> b!1199637 m!1105623))

(declare-fun m!1105625 () Bool)

(assert (=> b!1199641 m!1105625))

(declare-fun m!1105627 () Bool)

(assert (=> start!100460 m!1105627))

(declare-fun m!1105629 () Bool)

(assert (=> start!100460 m!1105629))

(declare-fun m!1105631 () Bool)

(assert (=> b!1199648 m!1105631))

(declare-fun m!1105633 () Bool)

(assert (=> b!1199648 m!1105633))

(declare-fun m!1105635 () Bool)

(assert (=> b!1199648 m!1105635))

(declare-fun m!1105637 () Bool)

(assert (=> b!1199648 m!1105637))

(declare-fun m!1105639 () Bool)

(assert (=> b!1199640 m!1105639))

(declare-fun m!1105641 () Bool)

(assert (=> b!1199638 m!1105641))

(declare-fun m!1105643 () Bool)

(assert (=> b!1199649 m!1105643))

(declare-fun m!1105645 () Bool)

(assert (=> b!1199649 m!1105645))

(declare-fun m!1105647 () Bool)

(assert (=> b!1199636 m!1105647))

(check-sat (not b!1199637) (not start!100460) b_and!42445 (not b!1199641) (not b!1199640) (not b_next!25789) tp_is_empty!30493 (not b!1199638) (not b!1199649) (not b!1199636) (not b!1199639) (not b_lambda!20967) (not b!1199648) (not mapNonEmpty!47582))
(check-sat b_and!42445 (not b_next!25789))
