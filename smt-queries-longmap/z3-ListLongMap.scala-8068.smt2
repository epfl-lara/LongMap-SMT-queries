; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99510 () Bool)

(assert start!99510)

(declare-fun b_free!24853 () Bool)

(declare-fun b_next!24853 () Bool)

(assert (=> start!99510 (= b_free!24853 (not b_next!24853))))

(declare-fun tp!87272 () Bool)

(declare-fun b_and!40575 () Bool)

(assert (=> start!99510 (= tp!87272 b_and!40575)))

(declare-fun mapNonEmpty!45902 () Bool)

(declare-fun mapRes!45902 () Bool)

(declare-fun tp!87273 () Bool)

(declare-fun e!665417 () Bool)

(assert (=> mapNonEmpty!45902 (= mapRes!45902 (and tp!87273 e!665417))))

(declare-fun mapKey!45902 () (_ BitVec 32))

(declare-datatypes ((V!44305 0))(
  ( (V!44306 (val!14748 Int)) )
))
(declare-datatypes ((ValueCell!13982 0))(
  ( (ValueCellFull!13982 (v!17382 V!44305)) (EmptyCell!13982) )
))
(declare-fun mapRest!45902 () (Array (_ BitVec 32) ValueCell!13982))

(declare-datatypes ((array!75637 0))(
  ( (array!75638 (arr!36462 (Array (_ BitVec 32) ValueCell!13982)) (size!36999 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75637)

(declare-fun mapValue!45902 () ValueCell!13982)

(assert (=> mapNonEmpty!45902 (= (arr!36462 _values!996) (store mapRest!45902 mapKey!45902 mapValue!45902))))

(declare-fun b!1170627 () Bool)

(declare-fun e!665425 () Bool)

(declare-fun e!665418 () Bool)

(assert (=> b!1170627 (= e!665425 e!665418)))

(declare-fun res!776392 () Bool)

(assert (=> b!1170627 (=> res!776392 e!665418)))

(declare-datatypes ((array!75639 0))(
  ( (array!75640 (arr!36463 (Array (_ BitVec 32) (_ BitVec 64))) (size!37000 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75639)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1170627 (= res!776392 (not (= (select (arr!36463 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1170628 () Bool)

(declare-fun e!665420 () Bool)

(declare-fun e!665416 () Bool)

(assert (=> b!1170628 (= e!665420 e!665416)))

(declare-fun res!776404 () Bool)

(assert (=> b!1170628 (=> res!776404 e!665416)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1170628 (= res!776404 (not (validKeyInArray!0 (select (arr!36463 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!18856 0))(
  ( (tuple2!18857 (_1!9439 (_ BitVec 64)) (_2!9439 V!44305)) )
))
(declare-datatypes ((List!25594 0))(
  ( (Nil!25591) (Cons!25590 (h!26808 tuple2!18856) (t!37431 List!25594)) )
))
(declare-datatypes ((ListLongMap!16833 0))(
  ( (ListLongMap!16834 (toList!8432 List!25594)) )
))
(declare-fun lt!527024 () ListLongMap!16833)

(declare-fun lt!527021 () ListLongMap!16833)

(assert (=> b!1170628 (= lt!527024 lt!527021)))

(declare-fun lt!527020 () ListLongMap!16833)

(declare-fun -!1491 (ListLongMap!16833 (_ BitVec 64)) ListLongMap!16833)

(assert (=> b!1170628 (= lt!527021 (-!1491 lt!527020 k0!934))))

(declare-fun zeroValue!944 () V!44305)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!527026 () array!75639)

(declare-fun lt!527018 () array!75637)

(declare-fun minValue!944 () V!44305)

(declare-fun getCurrentListMapNoExtraKeys!4922 (array!75639 array!75637 (_ BitVec 32) (_ BitVec 32) V!44305 V!44305 (_ BitVec 32) Int) ListLongMap!16833)

(assert (=> b!1170628 (= lt!527024 (getCurrentListMapNoExtraKeys!4922 lt!527026 lt!527018 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1170628 (= lt!527020 (getCurrentListMapNoExtraKeys!4922 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!38557 0))(
  ( (Unit!38558) )
))
(declare-fun lt!527023 () Unit!38557)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!716 (array!75639 array!75637 (_ BitVec 32) (_ BitVec 32) V!44305 V!44305 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38557)

(assert (=> b!1170628 (= lt!527023 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!716 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1170629 () Bool)

(declare-fun res!776402 () Bool)

(declare-fun e!665419 () Bool)

(assert (=> b!1170629 (=> (not res!776402) (not e!665419))))

(assert (=> b!1170629 (= res!776402 (and (= (size!36999 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37000 _keys!1208) (size!36999 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1170630 () Bool)

(declare-fun e!665424 () Bool)

(declare-fun tp_is_empty!29383 () Bool)

(assert (=> b!1170630 (= e!665424 tp_is_empty!29383)))

(declare-fun b!1170631 () Bool)

(declare-fun res!776394 () Bool)

(assert (=> b!1170631 (=> (not res!776394) (not e!665419))))

(assert (=> b!1170631 (= res!776394 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37000 _keys!1208))))))

(declare-fun b!1170632 () Bool)

(declare-fun e!665421 () Bool)

(assert (=> b!1170632 (= e!665421 e!665420)))

(declare-fun res!776396 () Bool)

(assert (=> b!1170632 (=> res!776396 e!665420)))

(assert (=> b!1170632 (= res!776396 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!527019 () ListLongMap!16833)

(assert (=> b!1170632 (= lt!527019 (getCurrentListMapNoExtraKeys!4922 lt!527026 lt!527018 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!527025 () V!44305)

(assert (=> b!1170632 (= lt!527018 (array!75638 (store (arr!36462 _values!996) i!673 (ValueCellFull!13982 lt!527025)) (size!36999 _values!996)))))

(declare-fun dynLambda!2906 (Int (_ BitVec 64)) V!44305)

(assert (=> b!1170632 (= lt!527025 (dynLambda!2906 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!527022 () ListLongMap!16833)

(assert (=> b!1170632 (= lt!527022 (getCurrentListMapNoExtraKeys!4922 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!776405 () Bool)

(assert (=> start!99510 (=> (not res!776405) (not e!665419))))

(assert (=> start!99510 (= res!776405 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37000 _keys!1208))))))

(assert (=> start!99510 e!665419))

(assert (=> start!99510 tp_is_empty!29383))

(declare-fun array_inv!27940 (array!75639) Bool)

(assert (=> start!99510 (array_inv!27940 _keys!1208)))

(assert (=> start!99510 true))

(assert (=> start!99510 tp!87272))

(declare-fun e!665426 () Bool)

(declare-fun array_inv!27941 (array!75637) Bool)

(assert (=> start!99510 (and (array_inv!27941 _values!996) e!665426)))

(declare-fun b!1170633 () Bool)

(declare-fun res!776401 () Bool)

(assert (=> b!1170633 (=> (not res!776401) (not e!665419))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75639 (_ BitVec 32)) Bool)

(assert (=> b!1170633 (= res!776401 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1170634 () Bool)

(declare-fun e!665423 () Bool)

(assert (=> b!1170634 (= e!665423 (not e!665421))))

(declare-fun res!776398 () Bool)

(assert (=> b!1170634 (=> res!776398 e!665421)))

(assert (=> b!1170634 (= res!776398 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75639 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1170634 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!527017 () Unit!38557)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75639 (_ BitVec 64) (_ BitVec 32)) Unit!38557)

(assert (=> b!1170634 (= lt!527017 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!45902 () Bool)

(assert (=> mapIsEmpty!45902 mapRes!45902))

(declare-fun b!1170635 () Bool)

(declare-fun res!776393 () Bool)

(assert (=> b!1170635 (=> (not res!776393) (not e!665419))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1170635 (= res!776393 (validMask!0 mask!1564))))

(declare-fun b!1170636 () Bool)

(declare-fun res!776400 () Bool)

(assert (=> b!1170636 (=> (not res!776400) (not e!665423))))

(declare-datatypes ((List!25595 0))(
  ( (Nil!25592) (Cons!25591 (h!26809 (_ BitVec 64)) (t!37432 List!25595)) )
))
(declare-fun arrayNoDuplicates!0 (array!75639 (_ BitVec 32) List!25595) Bool)

(assert (=> b!1170636 (= res!776400 (arrayNoDuplicates!0 lt!527026 #b00000000000000000000000000000000 Nil!25592))))

(declare-fun b!1170637 () Bool)

(declare-fun res!776391 () Bool)

(assert (=> b!1170637 (=> (not res!776391) (not e!665419))))

(assert (=> b!1170637 (= res!776391 (= (select (arr!36463 _keys!1208) i!673) k0!934))))

(declare-fun b!1170638 () Bool)

(declare-fun res!776399 () Bool)

(assert (=> b!1170638 (=> (not res!776399) (not e!665419))))

(assert (=> b!1170638 (= res!776399 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25592))))

(declare-fun b!1170639 () Bool)

(declare-fun res!776397 () Bool)

(assert (=> b!1170639 (=> (not res!776397) (not e!665419))))

(assert (=> b!1170639 (= res!776397 (validKeyInArray!0 k0!934))))

(declare-fun b!1170640 () Bool)

(assert (=> b!1170640 (= e!665417 tp_is_empty!29383)))

(declare-fun b!1170641 () Bool)

(assert (=> b!1170641 (= e!665416 true)))

(assert (=> b!1170641 e!665425))

(declare-fun res!776395 () Bool)

(assert (=> b!1170641 (=> (not res!776395) (not e!665425))))

(declare-fun +!3775 (ListLongMap!16833 tuple2!18856) ListLongMap!16833)

(declare-fun get!18611 (ValueCell!13982 V!44305) V!44305)

(assert (=> b!1170641 (= res!776395 (= lt!527019 (+!3775 lt!527021 (tuple2!18857 (select (arr!36463 _keys!1208) from!1455) (get!18611 (select (arr!36462 _values!996) from!1455) lt!527025)))))))

(declare-fun b!1170642 () Bool)

(assert (=> b!1170642 (= e!665419 e!665423)))

(declare-fun res!776403 () Bool)

(assert (=> b!1170642 (=> (not res!776403) (not e!665423))))

(assert (=> b!1170642 (= res!776403 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!527026 mask!1564))))

(assert (=> b!1170642 (= lt!527026 (array!75640 (store (arr!36463 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37000 _keys!1208)))))

(declare-fun b!1170643 () Bool)

(assert (=> b!1170643 (= e!665426 (and e!665424 mapRes!45902))))

(declare-fun condMapEmpty!45902 () Bool)

(declare-fun mapDefault!45902 () ValueCell!13982)

(assert (=> b!1170643 (= condMapEmpty!45902 (= (arr!36462 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13982)) mapDefault!45902)))))

(declare-fun b!1170644 () Bool)

(assert (=> b!1170644 (= e!665418 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!99510 res!776405) b!1170635))

(assert (= (and b!1170635 res!776393) b!1170629))

(assert (= (and b!1170629 res!776402) b!1170633))

(assert (= (and b!1170633 res!776401) b!1170638))

(assert (= (and b!1170638 res!776399) b!1170631))

(assert (= (and b!1170631 res!776394) b!1170639))

(assert (= (and b!1170639 res!776397) b!1170637))

(assert (= (and b!1170637 res!776391) b!1170642))

(assert (= (and b!1170642 res!776403) b!1170636))

(assert (= (and b!1170636 res!776400) b!1170634))

(assert (= (and b!1170634 (not res!776398)) b!1170632))

(assert (= (and b!1170632 (not res!776396)) b!1170628))

(assert (= (and b!1170628 (not res!776404)) b!1170641))

(assert (= (and b!1170641 res!776395) b!1170627))

(assert (= (and b!1170627 (not res!776392)) b!1170644))

(assert (= (and b!1170643 condMapEmpty!45902) mapIsEmpty!45902))

(assert (= (and b!1170643 (not condMapEmpty!45902)) mapNonEmpty!45902))

(get-info :version)

(assert (= (and mapNonEmpty!45902 ((_ is ValueCellFull!13982) mapValue!45902)) b!1170640))

(assert (= (and b!1170643 ((_ is ValueCellFull!13982) mapDefault!45902)) b!1170630))

(assert (= start!99510 b!1170643))

(declare-fun b_lambda!19991 () Bool)

(assert (=> (not b_lambda!19991) (not b!1170632)))

(declare-fun t!37430 () Bool)

(declare-fun tb!9657 () Bool)

(assert (=> (and start!99510 (= defaultEntry!1004 defaultEntry!1004) t!37430) tb!9657))

(declare-fun result!19889 () Bool)

(assert (=> tb!9657 (= result!19889 tp_is_empty!29383)))

(assert (=> b!1170632 t!37430))

(declare-fun b_and!40577 () Bool)

(assert (= b_and!40575 (and (=> t!37430 result!19889) b_and!40577)))

(declare-fun m!1078773 () Bool)

(assert (=> start!99510 m!1078773))

(declare-fun m!1078775 () Bool)

(assert (=> start!99510 m!1078775))

(declare-fun m!1078777 () Bool)

(assert (=> b!1170633 m!1078777))

(declare-fun m!1078779 () Bool)

(assert (=> mapNonEmpty!45902 m!1078779))

(declare-fun m!1078781 () Bool)

(assert (=> b!1170644 m!1078781))

(declare-fun m!1078783 () Bool)

(assert (=> b!1170628 m!1078783))

(declare-fun m!1078785 () Bool)

(assert (=> b!1170628 m!1078785))

(declare-fun m!1078787 () Bool)

(assert (=> b!1170628 m!1078787))

(declare-fun m!1078789 () Bool)

(assert (=> b!1170628 m!1078789))

(declare-fun m!1078791 () Bool)

(assert (=> b!1170628 m!1078791))

(declare-fun m!1078793 () Bool)

(assert (=> b!1170628 m!1078793))

(assert (=> b!1170628 m!1078791))

(declare-fun m!1078795 () Bool)

(assert (=> b!1170635 m!1078795))

(declare-fun m!1078797 () Bool)

(assert (=> b!1170642 m!1078797))

(declare-fun m!1078799 () Bool)

(assert (=> b!1170642 m!1078799))

(assert (=> b!1170627 m!1078791))

(declare-fun m!1078801 () Bool)

(assert (=> b!1170638 m!1078801))

(assert (=> b!1170641 m!1078791))

(declare-fun m!1078803 () Bool)

(assert (=> b!1170641 m!1078803))

(assert (=> b!1170641 m!1078803))

(declare-fun m!1078805 () Bool)

(assert (=> b!1170641 m!1078805))

(declare-fun m!1078807 () Bool)

(assert (=> b!1170641 m!1078807))

(declare-fun m!1078809 () Bool)

(assert (=> b!1170637 m!1078809))

(declare-fun m!1078811 () Bool)

(assert (=> b!1170639 m!1078811))

(declare-fun m!1078813 () Bool)

(assert (=> b!1170632 m!1078813))

(declare-fun m!1078815 () Bool)

(assert (=> b!1170632 m!1078815))

(declare-fun m!1078817 () Bool)

(assert (=> b!1170632 m!1078817))

(declare-fun m!1078819 () Bool)

(assert (=> b!1170632 m!1078819))

(declare-fun m!1078821 () Bool)

(assert (=> b!1170634 m!1078821))

(declare-fun m!1078823 () Bool)

(assert (=> b!1170634 m!1078823))

(declare-fun m!1078825 () Bool)

(assert (=> b!1170636 m!1078825))

(check-sat tp_is_empty!29383 (not mapNonEmpty!45902) (not b!1170636) (not b!1170635) (not start!99510) (not b!1170634) (not b!1170641) (not b_next!24853) (not b!1170642) (not b_lambda!19991) (not b!1170638) (not b!1170632) (not b!1170628) b_and!40577 (not b!1170639) (not b!1170633) (not b!1170644))
(check-sat b_and!40577 (not b_next!24853))
