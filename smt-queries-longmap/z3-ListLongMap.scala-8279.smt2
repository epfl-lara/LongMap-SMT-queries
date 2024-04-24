; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101010 () Bool)

(assert start!101010)

(declare-fun b_free!25945 () Bool)

(declare-fun b_next!25945 () Bool)

(assert (=> start!101010 (= b_free!25945 (not b_next!25945))))

(declare-fun tp!90837 () Bool)

(declare-fun b_and!42879 () Bool)

(assert (=> start!101010 (= tp!90837 b_and!42879)))

(declare-fun b!1207508 () Bool)

(declare-fun e!685823 () Bool)

(declare-datatypes ((V!45993 0))(
  ( (V!45994 (val!15381 Int)) )
))
(declare-datatypes ((tuple2!19744 0))(
  ( (tuple2!19745 (_1!9883 (_ BitVec 64)) (_2!9883 V!45993)) )
))
(declare-datatypes ((List!26552 0))(
  ( (Nil!26549) (Cons!26548 (h!27766 tuple2!19744) (t!39469 List!26552)) )
))
(declare-datatypes ((ListLongMap!17721 0))(
  ( (ListLongMap!17722 (toList!8876 List!26552)) )
))
(declare-fun call!58736 () ListLongMap!17721)

(declare-fun call!58734 () ListLongMap!17721)

(assert (=> b!1207508 (= e!685823 (= call!58736 call!58734))))

(declare-fun bm!58731 () Bool)

(declare-fun call!58738 () Bool)

(declare-fun call!58737 () Bool)

(assert (=> bm!58731 (= call!58738 call!58737)))

(declare-fun bm!58732 () Bool)

(declare-fun call!58739 () ListLongMap!17721)

(declare-fun call!58741 () ListLongMap!17721)

(assert (=> bm!58732 (= call!58739 call!58741)))

(declare-fun b!1207509 () Bool)

(declare-fun e!685836 () Bool)

(declare-fun e!685828 () Bool)

(declare-fun mapRes!47829 () Bool)

(assert (=> b!1207509 (= e!685836 (and e!685828 mapRes!47829))))

(declare-fun condMapEmpty!47829 () Bool)

(declare-datatypes ((ValueCell!14615 0))(
  ( (ValueCellFull!14615 (v!18021 V!45993)) (EmptyCell!14615) )
))
(declare-datatypes ((array!78111 0))(
  ( (array!78112 (arr!37690 (Array (_ BitVec 32) ValueCell!14615)) (size!38227 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78111)

(declare-fun mapDefault!47829 () ValueCell!14615)

(assert (=> b!1207509 (= condMapEmpty!47829 (= (arr!37690 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14615)) mapDefault!47829)))))

(declare-fun b!1207510 () Bool)

(declare-fun e!685821 () Bool)

(declare-fun e!685833 () Bool)

(assert (=> b!1207510 (= e!685821 e!685833)))

(declare-fun res!802708 () Bool)

(assert (=> b!1207510 (=> res!802708 e!685833)))

(declare-fun lt!547645 () ListLongMap!17721)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!6955 (ListLongMap!17721 (_ BitVec 64)) Bool)

(assert (=> b!1207510 (= res!802708 (not (contains!6955 lt!547645 k0!934)))))

(declare-fun zeroValue!944 () V!45993)

(declare-datatypes ((array!78113 0))(
  ( (array!78114 (arr!37691 (Array (_ BitVec 32) (_ BitVec 64))) (size!38228 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78113)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!45993)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5338 (array!78113 array!78111 (_ BitVec 32) (_ BitVec 32) V!45993 V!45993 (_ BitVec 32) Int) ListLongMap!17721)

(assert (=> b!1207510 (= lt!547645 (getCurrentListMapNoExtraKeys!5338 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1207511 () Bool)

(declare-fun res!802707 () Bool)

(declare-fun e!685826 () Bool)

(assert (=> b!1207511 (=> (not res!802707) (not e!685826))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1207511 (= res!802707 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38228 _keys!1208))))))

(declare-fun e!685831 () Bool)

(declare-fun b!1207512 () Bool)

(declare-fun arrayContainsKey!0 (array!78113 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1207512 (= e!685831 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1207513 () Bool)

(declare-fun res!802712 () Bool)

(assert (=> b!1207513 (=> (not res!802712) (not e!685826))))

(assert (=> b!1207513 (= res!802712 (and (= (size!38227 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38228 _keys!1208) (size!38227 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!58733 () Bool)

(assert (=> bm!58733 (= call!58734 (getCurrentListMapNoExtraKeys!5338 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1207514 () Bool)

(declare-fun e!685824 () Bool)

(declare-fun tp_is_empty!30649 () Bool)

(assert (=> b!1207514 (= e!685824 tp_is_empty!30649)))

(declare-fun e!685835 () Bool)

(declare-fun b!1207515 () Bool)

(assert (=> b!1207515 (= e!685835 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1207516 () Bool)

(declare-fun res!802713 () Bool)

(assert (=> b!1207516 (=> (not res!802713) (not e!685826))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1207516 (= res!802713 (validKeyInArray!0 k0!934))))

(declare-fun b!1207517 () Bool)

(declare-fun e!685827 () Bool)

(assert (=> b!1207517 (= e!685827 e!685821)))

(declare-fun res!802704 () Bool)

(assert (=> b!1207517 (=> res!802704 e!685821)))

(assert (=> b!1207517 (= res!802704 (not (= (select (arr!37691 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1207517 e!685823))

(declare-fun c!118821 () Bool)

(assert (=> b!1207517 (= c!118821 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!39945 0))(
  ( (Unit!39946) )
))
(declare-fun lt!547644 () Unit!39945)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1036 (array!78113 array!78111 (_ BitVec 32) (_ BitVec 32) V!45993 V!45993 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39945)

(assert (=> b!1207517 (= lt!547644 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1036 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!47829 () Bool)

(declare-fun tp!90838 () Bool)

(assert (=> mapNonEmpty!47829 (= mapRes!47829 (and tp!90838 e!685824))))

(declare-fun mapKey!47829 () (_ BitVec 32))

(declare-fun mapRest!47829 () (Array (_ BitVec 32) ValueCell!14615))

(declare-fun mapValue!47829 () ValueCell!14615)

(assert (=> mapNonEmpty!47829 (= (arr!37690 _values!996) (store mapRest!47829 mapKey!47829 mapValue!47829))))

(declare-fun c!118820 () Bool)

(declare-fun bm!58734 () Bool)

(declare-fun lt!547638 () ListLongMap!17721)

(assert (=> bm!58734 (= call!58737 (contains!6955 (ite c!118820 lt!547638 call!58739) k0!934))))

(declare-fun b!1207519 () Bool)

(declare-fun e!685830 () Unit!39945)

(declare-fun lt!547646 () Unit!39945)

(assert (=> b!1207519 (= e!685830 lt!547646)))

(declare-fun call!58740 () Unit!39945)

(assert (=> b!1207519 (= lt!547646 call!58740)))

(assert (=> b!1207519 call!58738))

(declare-fun b!1207520 () Bool)

(declare-fun res!802711 () Bool)

(assert (=> b!1207520 (=> (not res!802711) (not e!685826))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78113 (_ BitVec 32)) Bool)

(assert (=> b!1207520 (= res!802711 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1207521 () Bool)

(declare-fun Unit!39947 () Unit!39945)

(assert (=> b!1207521 (= e!685830 Unit!39947)))

(declare-fun b!1207522 () Bool)

(declare-fun res!802706 () Bool)

(assert (=> b!1207522 (=> (not res!802706) (not e!685826))))

(declare-datatypes ((List!26553 0))(
  ( (Nil!26550) (Cons!26549 (h!27767 (_ BitVec 64)) (t!39470 List!26553)) )
))
(declare-fun arrayNoDuplicates!0 (array!78113 (_ BitVec 32) List!26553) Bool)

(assert (=> b!1207522 (= res!802706 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26550))))

(declare-fun b!1207523 () Bool)

(declare-fun e!685832 () Bool)

(assert (=> b!1207523 (= e!685826 e!685832)))

(declare-fun res!802705 () Bool)

(assert (=> b!1207523 (=> (not res!802705) (not e!685832))))

(declare-fun lt!547647 () array!78113)

(assert (=> b!1207523 (= res!802705 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!547647 mask!1564))))

(assert (=> b!1207523 (= lt!547647 (array!78114 (store (arr!37691 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38228 _keys!1208)))))

(declare-fun b!1207524 () Bool)

(declare-fun e!685825 () Bool)

(assert (=> b!1207524 (= e!685832 (not e!685825))))

(declare-fun res!802710 () Bool)

(assert (=> b!1207524 (=> res!802710 e!685825)))

(assert (=> b!1207524 (= res!802710 (bvsgt from!1455 i!673))))

(assert (=> b!1207524 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!547648 () Unit!39945)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78113 (_ BitVec 64) (_ BitVec 32)) Unit!39945)

(assert (=> b!1207524 (= lt!547648 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun c!118818 () Bool)

(declare-fun bm!58735 () Bool)

(declare-fun +!4040 (ListLongMap!17721 tuple2!19744) ListLongMap!17721)

(assert (=> bm!58735 (= call!58741 (+!4040 lt!547645 (ite (or c!118820 c!118818) (tuple2!19745 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19745 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1207525 () Bool)

(declare-fun res!802703 () Bool)

(assert (=> b!1207525 (=> (not res!802703) (not e!685832))))

(assert (=> b!1207525 (= res!802703 (arrayNoDuplicates!0 lt!547647 #b00000000000000000000000000000000 Nil!26550))))

(declare-fun b!1207526 () Bool)

(declare-fun res!802716 () Bool)

(assert (=> b!1207526 (=> (not res!802716) (not e!685826))))

(assert (=> b!1207526 (= res!802716 (= (select (arr!37691 _keys!1208) i!673) k0!934))))

(declare-fun b!1207527 () Bool)

(declare-fun c!118817 () Bool)

(declare-fun lt!547649 () Bool)

(assert (=> b!1207527 (= c!118817 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!547649))))

(declare-fun e!685834 () Unit!39945)

(assert (=> b!1207527 (= e!685834 e!685830)))

(declare-fun b!1207528 () Bool)

(declare-fun e!685829 () Unit!39945)

(declare-fun lt!547634 () Unit!39945)

(assert (=> b!1207528 (= e!685829 lt!547634)))

(declare-fun lt!547642 () Unit!39945)

(declare-fun addStillContains!1024 (ListLongMap!17721 (_ BitVec 64) V!45993 (_ BitVec 64)) Unit!39945)

(assert (=> b!1207528 (= lt!547642 (addStillContains!1024 lt!547645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1207528 (= lt!547638 call!58741)))

(assert (=> b!1207528 call!58737))

(declare-fun call!58735 () Unit!39945)

(assert (=> b!1207528 (= lt!547634 call!58735)))

(assert (=> b!1207528 (contains!6955 (+!4040 lt!547638 (tuple2!19745 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!547639 () array!78111)

(declare-fun bm!58736 () Bool)

(assert (=> bm!58736 (= call!58736 (getCurrentListMapNoExtraKeys!5338 lt!547647 lt!547639 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1207529 () Bool)

(assert (=> b!1207529 call!58738))

(declare-fun lt!547643 () Unit!39945)

(assert (=> b!1207529 (= lt!547643 call!58740)))

(assert (=> b!1207529 (= e!685834 lt!547643)))

(declare-fun b!1207530 () Bool)

(assert (=> b!1207530 (= e!685828 tp_is_empty!30649)))

(declare-fun b!1207531 () Bool)

(assert (=> b!1207531 (= e!685829 e!685834)))

(assert (=> b!1207531 (= c!118818 (and (not lt!547649) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!58737 () Bool)

(assert (=> bm!58737 (= call!58740 call!58735)))

(declare-fun bm!58738 () Bool)

(assert (=> bm!58738 (= call!58735 (addStillContains!1024 (ite c!118820 lt!547638 lt!547645) (ite c!118820 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118818 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118820 minValue!944 (ite c!118818 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1207532 () Bool)

(declare-fun res!802709 () Bool)

(assert (=> b!1207532 (=> (not res!802709) (not e!685826))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1207532 (= res!802709 (validMask!0 mask!1564))))

(declare-fun res!802715 () Bool)

(assert (=> start!101010 (=> (not res!802715) (not e!685826))))

(assert (=> start!101010 (= res!802715 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38228 _keys!1208))))))

(assert (=> start!101010 e!685826))

(assert (=> start!101010 tp_is_empty!30649))

(declare-fun array_inv!28778 (array!78113) Bool)

(assert (=> start!101010 (array_inv!28778 _keys!1208)))

(assert (=> start!101010 true))

(assert (=> start!101010 tp!90837))

(declare-fun array_inv!28779 (array!78111) Bool)

(assert (=> start!101010 (and (array_inv!28779 _values!996) e!685836)))

(declare-fun b!1207518 () Bool)

(assert (=> b!1207518 (= e!685835 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!547649) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1207533 () Bool)

(assert (=> b!1207533 (= e!685825 e!685827)))

(declare-fun res!802714 () Bool)

(assert (=> b!1207533 (=> res!802714 e!685827)))

(assert (=> b!1207533 (= res!802714 (not (= from!1455 i!673)))))

(declare-fun lt!547635 () ListLongMap!17721)

(assert (=> b!1207533 (= lt!547635 (getCurrentListMapNoExtraKeys!5338 lt!547647 lt!547639 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3261 (Int (_ BitVec 64)) V!45993)

(assert (=> b!1207533 (= lt!547639 (array!78112 (store (arr!37690 _values!996) i!673 (ValueCellFull!14615 (dynLambda!3261 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38227 _values!996)))))

(declare-fun lt!547637 () ListLongMap!17721)

(assert (=> b!1207533 (= lt!547637 (getCurrentListMapNoExtraKeys!5338 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1207534 () Bool)

(declare-fun -!1818 (ListLongMap!17721 (_ BitVec 64)) ListLongMap!17721)

(assert (=> b!1207534 (= e!685823 (= call!58736 (-!1818 call!58734 k0!934)))))

(declare-fun mapIsEmpty!47829 () Bool)

(assert (=> mapIsEmpty!47829 mapRes!47829))

(declare-fun b!1207535 () Bool)

(assert (=> b!1207535 (= e!685833 (bvslt (size!38228 _keys!1208) #b01111111111111111111111111111111))))

(assert (=> b!1207535 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26550)))

(declare-fun lt!547641 () Unit!39945)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78113 (_ BitVec 32) (_ BitVec 32)) Unit!39945)

(assert (=> b!1207535 (= lt!547641 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1207535 e!685831))

(declare-fun res!802717 () Bool)

(assert (=> b!1207535 (=> (not res!802717) (not e!685831))))

(assert (=> b!1207535 (= res!802717 e!685835)))

(declare-fun c!118819 () Bool)

(assert (=> b!1207535 (= c!118819 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!547636 () Unit!39945)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!577 (array!78113 array!78111 (_ BitVec 32) (_ BitVec 32) V!45993 V!45993 (_ BitVec 64) (_ BitVec 32) Int) Unit!39945)

(assert (=> b!1207535 (= lt!547636 (lemmaListMapContainsThenArrayContainsFrom!577 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!547640 () Unit!39945)

(assert (=> b!1207535 (= lt!547640 e!685829)))

(assert (=> b!1207535 (= c!118820 (and (not lt!547649) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1207535 (= lt!547649 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (= (and start!101010 res!802715) b!1207532))

(assert (= (and b!1207532 res!802709) b!1207513))

(assert (= (and b!1207513 res!802712) b!1207520))

(assert (= (and b!1207520 res!802711) b!1207522))

(assert (= (and b!1207522 res!802706) b!1207511))

(assert (= (and b!1207511 res!802707) b!1207516))

(assert (= (and b!1207516 res!802713) b!1207526))

(assert (= (and b!1207526 res!802716) b!1207523))

(assert (= (and b!1207523 res!802705) b!1207525))

(assert (= (and b!1207525 res!802703) b!1207524))

(assert (= (and b!1207524 (not res!802710)) b!1207533))

(assert (= (and b!1207533 (not res!802714)) b!1207517))

(assert (= (and b!1207517 c!118821) b!1207534))

(assert (= (and b!1207517 (not c!118821)) b!1207508))

(assert (= (or b!1207534 b!1207508) bm!58736))

(assert (= (or b!1207534 b!1207508) bm!58733))

(assert (= (and b!1207517 (not res!802704)) b!1207510))

(assert (= (and b!1207510 (not res!802708)) b!1207535))

(assert (= (and b!1207535 c!118820) b!1207528))

(assert (= (and b!1207535 (not c!118820)) b!1207531))

(assert (= (and b!1207531 c!118818) b!1207529))

(assert (= (and b!1207531 (not c!118818)) b!1207527))

(assert (= (and b!1207527 c!118817) b!1207519))

(assert (= (and b!1207527 (not c!118817)) b!1207521))

(assert (= (or b!1207529 b!1207519) bm!58737))

(assert (= (or b!1207529 b!1207519) bm!58732))

(assert (= (or b!1207529 b!1207519) bm!58731))

(assert (= (or b!1207528 bm!58731) bm!58734))

(assert (= (or b!1207528 bm!58737) bm!58738))

(assert (= (or b!1207528 bm!58732) bm!58735))

(assert (= (and b!1207535 c!118819) b!1207515))

(assert (= (and b!1207535 (not c!118819)) b!1207518))

(assert (= (and b!1207535 res!802717) b!1207512))

(assert (= (and b!1207509 condMapEmpty!47829) mapIsEmpty!47829))

(assert (= (and b!1207509 (not condMapEmpty!47829)) mapNonEmpty!47829))

(get-info :version)

(assert (= (and mapNonEmpty!47829 ((_ is ValueCellFull!14615) mapValue!47829)) b!1207514))

(assert (= (and b!1207509 ((_ is ValueCellFull!14615) mapDefault!47829)) b!1207530))

(assert (= start!101010 b!1207509))

(declare-fun b_lambda!21343 () Bool)

(assert (=> (not b_lambda!21343) (not b!1207533)))

(declare-fun t!39468 () Bool)

(declare-fun tb!10737 () Bool)

(assert (=> (and start!101010 (= defaultEntry!1004 defaultEntry!1004) t!39468) tb!10737))

(declare-fun result!22067 () Bool)

(assert (=> tb!10737 (= result!22067 tp_is_empty!30649)))

(assert (=> b!1207533 t!39468))

(declare-fun b_and!42881 () Bool)

(assert (= b_and!42879 (and (=> t!39468 result!22067) b_and!42881)))

(declare-fun m!1113497 () Bool)

(assert (=> b!1207516 m!1113497))

(declare-fun m!1113499 () Bool)

(assert (=> b!1207523 m!1113499))

(declare-fun m!1113501 () Bool)

(assert (=> b!1207523 m!1113501))

(declare-fun m!1113503 () Bool)

(assert (=> b!1207515 m!1113503))

(declare-fun m!1113505 () Bool)

(assert (=> b!1207534 m!1113505))

(declare-fun m!1113507 () Bool)

(assert (=> bm!58734 m!1113507))

(declare-fun m!1113509 () Bool)

(assert (=> bm!58733 m!1113509))

(declare-fun m!1113511 () Bool)

(assert (=> b!1207533 m!1113511))

(declare-fun m!1113513 () Bool)

(assert (=> b!1207533 m!1113513))

(declare-fun m!1113515 () Bool)

(assert (=> b!1207533 m!1113515))

(declare-fun m!1113517 () Bool)

(assert (=> b!1207533 m!1113517))

(declare-fun m!1113519 () Bool)

(assert (=> b!1207520 m!1113519))

(declare-fun m!1113521 () Bool)

(assert (=> mapNonEmpty!47829 m!1113521))

(declare-fun m!1113523 () Bool)

(assert (=> b!1207532 m!1113523))

(declare-fun m!1113525 () Bool)

(assert (=> b!1207522 m!1113525))

(declare-fun m!1113527 () Bool)

(assert (=> bm!58736 m!1113527))

(declare-fun m!1113529 () Bool)

(assert (=> b!1207535 m!1113529))

(declare-fun m!1113531 () Bool)

(assert (=> b!1207535 m!1113531))

(declare-fun m!1113533 () Bool)

(assert (=> b!1207535 m!1113533))

(declare-fun m!1113535 () Bool)

(assert (=> b!1207526 m!1113535))

(declare-fun m!1113537 () Bool)

(assert (=> b!1207524 m!1113537))

(declare-fun m!1113539 () Bool)

(assert (=> b!1207524 m!1113539))

(assert (=> b!1207512 m!1113503))

(declare-fun m!1113541 () Bool)

(assert (=> b!1207517 m!1113541))

(declare-fun m!1113543 () Bool)

(assert (=> b!1207517 m!1113543))

(declare-fun m!1113545 () Bool)

(assert (=> b!1207525 m!1113545))

(declare-fun m!1113547 () Bool)

(assert (=> b!1207528 m!1113547))

(declare-fun m!1113549 () Bool)

(assert (=> b!1207528 m!1113549))

(assert (=> b!1207528 m!1113549))

(declare-fun m!1113551 () Bool)

(assert (=> b!1207528 m!1113551))

(declare-fun m!1113553 () Bool)

(assert (=> start!101010 m!1113553))

(declare-fun m!1113555 () Bool)

(assert (=> start!101010 m!1113555))

(declare-fun m!1113557 () Bool)

(assert (=> b!1207510 m!1113557))

(assert (=> b!1207510 m!1113509))

(declare-fun m!1113559 () Bool)

(assert (=> bm!58738 m!1113559))

(declare-fun m!1113561 () Bool)

(assert (=> bm!58735 m!1113561))

(check-sat (not b!1207510) (not b!1207515) (not bm!58738) (not b!1207522) (not b!1207520) (not b!1207525) (not b!1207516) (not b!1207512) (not b_next!25945) (not b!1207523) (not b!1207532) (not b_lambda!21343) (not bm!58735) (not b!1207534) b_and!42881 (not b!1207517) (not start!101010) (not b!1207535) (not b!1207528) (not bm!58734) (not b!1207533) (not mapNonEmpty!47829) (not bm!58736) (not b!1207524) (not bm!58733) tp_is_empty!30649)
(check-sat b_and!42881 (not b_next!25945))
(get-model)

(declare-fun b_lambda!21349 () Bool)

(assert (= b_lambda!21343 (or (and start!101010 b_free!25945) b_lambda!21349)))

(check-sat (not b!1207510) (not b!1207515) (not bm!58738) (not b!1207532) (not b!1207522) (not b!1207525) (not b!1207516) (not b!1207512) (not b_next!25945) (not b!1207523) (not b!1207520) (not b_lambda!21349) (not bm!58735) (not b!1207534) b_and!42881 (not b!1207517) (not start!101010) (not b!1207535) (not b!1207528) (not bm!58734) (not b!1207533) (not mapNonEmpty!47829) (not bm!58736) (not b!1207524) (not bm!58733) tp_is_empty!30649)
(check-sat b_and!42881 (not b_next!25945))
(get-model)

(declare-fun b!1207720 () Bool)

(declare-fun e!685944 () Bool)

(declare-fun contains!6958 (List!26553 (_ BitVec 64)) Bool)

(assert (=> b!1207720 (= e!685944 (contains!6958 Nil!26550 (select (arr!37691 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun bm!58789 () Bool)

(declare-fun call!58792 () Bool)

(declare-fun c!118854 () Bool)

(assert (=> bm!58789 (= call!58792 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!118854 (Cons!26549 (select (arr!37691 _keys!1208) #b00000000000000000000000000000000) Nil!26550) Nil!26550)))))

(declare-fun b!1207721 () Bool)

(declare-fun e!685941 () Bool)

(declare-fun e!685943 () Bool)

(assert (=> b!1207721 (= e!685941 e!685943)))

(declare-fun res!802815 () Bool)

(assert (=> b!1207721 (=> (not res!802815) (not e!685943))))

(assert (=> b!1207721 (= res!802815 (not e!685944))))

(declare-fun res!802816 () Bool)

(assert (=> b!1207721 (=> (not res!802816) (not e!685944))))

(assert (=> b!1207721 (= res!802816 (validKeyInArray!0 (select (arr!37691 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1207722 () Bool)

(declare-fun e!685942 () Bool)

(assert (=> b!1207722 (= e!685942 call!58792)))

(declare-fun d!133337 () Bool)

(declare-fun res!802814 () Bool)

(assert (=> d!133337 (=> res!802814 e!685941)))

(assert (=> d!133337 (= res!802814 (bvsge #b00000000000000000000000000000000 (size!38228 _keys!1208)))))

(assert (=> d!133337 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26550) e!685941)))

(declare-fun b!1207723 () Bool)

(assert (=> b!1207723 (= e!685943 e!685942)))

(assert (=> b!1207723 (= c!118854 (validKeyInArray!0 (select (arr!37691 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1207724 () Bool)

(assert (=> b!1207724 (= e!685942 call!58792)))

(assert (= (and d!133337 (not res!802814)) b!1207721))

(assert (= (and b!1207721 res!802816) b!1207720))

(assert (= (and b!1207721 res!802815) b!1207723))

(assert (= (and b!1207723 c!118854) b!1207722))

(assert (= (and b!1207723 (not c!118854)) b!1207724))

(assert (= (or b!1207722 b!1207724) bm!58789))

(declare-fun m!1113697 () Bool)

(assert (=> b!1207720 m!1113697))

(assert (=> b!1207720 m!1113697))

(declare-fun m!1113699 () Bool)

(assert (=> b!1207720 m!1113699))

(assert (=> bm!58789 m!1113697))

(declare-fun m!1113701 () Bool)

(assert (=> bm!58789 m!1113701))

(assert (=> b!1207721 m!1113697))

(assert (=> b!1207721 m!1113697))

(declare-fun m!1113703 () Bool)

(assert (=> b!1207721 m!1113703))

(assert (=> b!1207723 m!1113697))

(assert (=> b!1207723 m!1113697))

(assert (=> b!1207723 m!1113703))

(assert (=> b!1207522 d!133337))

(declare-fun b!1207749 () Bool)

(declare-fun e!685960 () ListLongMap!17721)

(declare-fun call!58795 () ListLongMap!17721)

(assert (=> b!1207749 (= e!685960 call!58795)))

(declare-fun b!1207750 () Bool)

(declare-fun e!685962 () Bool)

(declare-fun e!685964 () Bool)

(assert (=> b!1207750 (= e!685962 e!685964)))

(declare-fun c!118866 () Bool)

(declare-fun e!685959 () Bool)

(assert (=> b!1207750 (= c!118866 e!685959)))

(declare-fun res!802828 () Bool)

(assert (=> b!1207750 (=> (not res!802828) (not e!685959))))

(assert (=> b!1207750 (= res!802828 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38228 _keys!1208)))))

(declare-fun b!1207751 () Bool)

(declare-fun e!685963 () ListLongMap!17721)

(assert (=> b!1207751 (= e!685963 e!685960)))

(declare-fun c!118864 () Bool)

(assert (=> b!1207751 (= c!118864 (validKeyInArray!0 (select (arr!37691 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1207752 () Bool)

(declare-fun e!685965 () Bool)

(declare-fun lt!547766 () ListLongMap!17721)

(declare-fun isEmpty!990 (ListLongMap!17721) Bool)

(assert (=> b!1207752 (= e!685965 (isEmpty!990 lt!547766))))

(declare-fun b!1207753 () Bool)

(declare-fun res!802826 () Bool)

(assert (=> b!1207753 (=> (not res!802826) (not e!685962))))

(assert (=> b!1207753 (= res!802826 (not (contains!6955 lt!547766 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!58792 () Bool)

(assert (=> bm!58792 (= call!58795 (getCurrentListMapNoExtraKeys!5338 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1207754 () Bool)

(assert (=> b!1207754 (= e!685965 (= lt!547766 (getCurrentListMapNoExtraKeys!5338 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1207755 () Bool)

(assert (=> b!1207755 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38228 _keys!1208)))))

(assert (=> b!1207755 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38227 _values!996)))))

(declare-fun e!685961 () Bool)

(declare-fun apply!973 (ListLongMap!17721 (_ BitVec 64)) V!45993)

(declare-fun get!19256 (ValueCell!14615 V!45993) V!45993)

(assert (=> b!1207755 (= e!685961 (= (apply!973 lt!547766 (select (arr!37691 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19256 (select (arr!37690 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3261 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1207756 () Bool)

(declare-fun lt!547764 () Unit!39945)

(declare-fun lt!547763 () Unit!39945)

(assert (=> b!1207756 (= lt!547764 lt!547763)))

(declare-fun lt!547765 () ListLongMap!17721)

(declare-fun lt!547762 () (_ BitVec 64))

(declare-fun lt!547761 () V!45993)

(declare-fun lt!547760 () (_ BitVec 64))

(assert (=> b!1207756 (not (contains!6955 (+!4040 lt!547765 (tuple2!19745 lt!547760 lt!547761)) lt!547762))))

(declare-fun addStillNotContains!294 (ListLongMap!17721 (_ BitVec 64) V!45993 (_ BitVec 64)) Unit!39945)

(assert (=> b!1207756 (= lt!547763 (addStillNotContains!294 lt!547765 lt!547760 lt!547761 lt!547762))))

(assert (=> b!1207756 (= lt!547762 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1207756 (= lt!547761 (get!19256 (select (arr!37690 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3261 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1207756 (= lt!547760 (select (arr!37691 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1207756 (= lt!547765 call!58795)))

(assert (=> b!1207756 (= e!685960 (+!4040 call!58795 (tuple2!19745 (select (arr!37691 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19256 (select (arr!37690 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3261 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1207757 () Bool)

(assert (=> b!1207757 (= e!685963 (ListLongMap!17722 Nil!26549))))

(declare-fun d!133339 () Bool)

(assert (=> d!133339 e!685962))

(declare-fun res!802827 () Bool)

(assert (=> d!133339 (=> (not res!802827) (not e!685962))))

(assert (=> d!133339 (= res!802827 (not (contains!6955 lt!547766 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133339 (= lt!547766 e!685963)))

(declare-fun c!118863 () Bool)

(assert (=> d!133339 (= c!118863 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38228 _keys!1208)))))

(assert (=> d!133339 (validMask!0 mask!1564)))

(assert (=> d!133339 (= (getCurrentListMapNoExtraKeys!5338 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!547766)))

(declare-fun b!1207758 () Bool)

(assert (=> b!1207758 (= e!685964 e!685965)))

(declare-fun c!118865 () Bool)

(assert (=> b!1207758 (= c!118865 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38228 _keys!1208)))))

(declare-fun b!1207759 () Bool)

(assert (=> b!1207759 (= e!685964 e!685961)))

(assert (=> b!1207759 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38228 _keys!1208)))))

(declare-fun res!802825 () Bool)

(assert (=> b!1207759 (= res!802825 (contains!6955 lt!547766 (select (arr!37691 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1207759 (=> (not res!802825) (not e!685961))))

(declare-fun b!1207760 () Bool)

(assert (=> b!1207760 (= e!685959 (validKeyInArray!0 (select (arr!37691 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1207760 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(assert (= (and d!133339 c!118863) b!1207757))

(assert (= (and d!133339 (not c!118863)) b!1207751))

(assert (= (and b!1207751 c!118864) b!1207756))

(assert (= (and b!1207751 (not c!118864)) b!1207749))

(assert (= (or b!1207756 b!1207749) bm!58792))

(assert (= (and d!133339 res!802827) b!1207753))

(assert (= (and b!1207753 res!802826) b!1207750))

(assert (= (and b!1207750 res!802828) b!1207760))

(assert (= (and b!1207750 c!118866) b!1207759))

(assert (= (and b!1207750 (not c!118866)) b!1207758))

(assert (= (and b!1207759 res!802825) b!1207755))

(assert (= (and b!1207758 c!118865) b!1207754))

(assert (= (and b!1207758 (not c!118865)) b!1207752))

(declare-fun b_lambda!21351 () Bool)

(assert (=> (not b_lambda!21351) (not b!1207755)))

(assert (=> b!1207755 t!39468))

(declare-fun b_and!42891 () Bool)

(assert (= b_and!42881 (and (=> t!39468 result!22067) b_and!42891)))

(declare-fun b_lambda!21353 () Bool)

(assert (=> (not b_lambda!21353) (not b!1207756)))

(assert (=> b!1207756 t!39468))

(declare-fun b_and!42893 () Bool)

(assert (= b_and!42891 (and (=> t!39468 result!22067) b_and!42893)))

(declare-fun m!1113705 () Bool)

(assert (=> b!1207754 m!1113705))

(declare-fun m!1113707 () Bool)

(assert (=> d!133339 m!1113707))

(assert (=> d!133339 m!1113523))

(declare-fun m!1113709 () Bool)

(assert (=> b!1207751 m!1113709))

(assert (=> b!1207751 m!1113709))

(declare-fun m!1113711 () Bool)

(assert (=> b!1207751 m!1113711))

(assert (=> b!1207760 m!1113709))

(assert (=> b!1207760 m!1113709))

(assert (=> b!1207760 m!1113711))

(declare-fun m!1113713 () Bool)

(assert (=> b!1207753 m!1113713))

(declare-fun m!1113715 () Bool)

(assert (=> b!1207752 m!1113715))

(assert (=> b!1207759 m!1113709))

(assert (=> b!1207759 m!1113709))

(declare-fun m!1113717 () Bool)

(assert (=> b!1207759 m!1113717))

(declare-fun m!1113719 () Bool)

(assert (=> b!1207756 m!1113719))

(assert (=> b!1207756 m!1113513))

(declare-fun m!1113721 () Bool)

(assert (=> b!1207756 m!1113721))

(declare-fun m!1113723 () Bool)

(assert (=> b!1207756 m!1113723))

(declare-fun m!1113725 () Bool)

(assert (=> b!1207756 m!1113725))

(assert (=> b!1207756 m!1113725))

(declare-fun m!1113727 () Bool)

(assert (=> b!1207756 m!1113727))

(assert (=> b!1207756 m!1113719))

(assert (=> b!1207756 m!1113513))

(declare-fun m!1113729 () Bool)

(assert (=> b!1207756 m!1113729))

(assert (=> b!1207756 m!1113709))

(assert (=> b!1207755 m!1113719))

(assert (=> b!1207755 m!1113513))

(assert (=> b!1207755 m!1113721))

(assert (=> b!1207755 m!1113709))

(declare-fun m!1113731 () Bool)

(assert (=> b!1207755 m!1113731))

(assert (=> b!1207755 m!1113719))

(assert (=> b!1207755 m!1113709))

(assert (=> b!1207755 m!1113513))

(assert (=> bm!58792 m!1113705))

(assert (=> bm!58733 d!133339))

(declare-fun d!133341 () Bool)

(declare-fun res!802833 () Bool)

(declare-fun e!685972 () Bool)

(assert (=> d!133341 (=> res!802833 e!685972)))

(assert (=> d!133341 (= res!802833 (bvsge #b00000000000000000000000000000000 (size!38228 _keys!1208)))))

(assert (=> d!133341 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!685972)))

(declare-fun b!1207769 () Bool)

(declare-fun e!685974 () Bool)

(declare-fun call!58798 () Bool)

(assert (=> b!1207769 (= e!685974 call!58798)))

(declare-fun b!1207770 () Bool)

(declare-fun e!685973 () Bool)

(assert (=> b!1207770 (= e!685973 call!58798)))

(declare-fun bm!58795 () Bool)

(assert (=> bm!58795 (= call!58798 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1207771 () Bool)

(assert (=> b!1207771 (= e!685974 e!685973)))

(declare-fun lt!547775 () (_ BitVec 64))

(assert (=> b!1207771 (= lt!547775 (select (arr!37691 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!547774 () Unit!39945)

(assert (=> b!1207771 (= lt!547774 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!547775 #b00000000000000000000000000000000))))

(assert (=> b!1207771 (arrayContainsKey!0 _keys!1208 lt!547775 #b00000000000000000000000000000000)))

(declare-fun lt!547773 () Unit!39945)

(assert (=> b!1207771 (= lt!547773 lt!547774)))

(declare-fun res!802834 () Bool)

(declare-datatypes ((SeekEntryResult!9893 0))(
  ( (MissingZero!9893 (index!41943 (_ BitVec 32))) (Found!9893 (index!41944 (_ BitVec 32))) (Intermediate!9893 (undefined!10705 Bool) (index!41945 (_ BitVec 32)) (x!106504 (_ BitVec 32))) (Undefined!9893) (MissingVacant!9893 (index!41946 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!78113 (_ BitVec 32)) SeekEntryResult!9893)

(assert (=> b!1207771 (= res!802834 (= (seekEntryOrOpen!0 (select (arr!37691 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9893 #b00000000000000000000000000000000)))))

(assert (=> b!1207771 (=> (not res!802834) (not e!685973))))

(declare-fun b!1207772 () Bool)

(assert (=> b!1207772 (= e!685972 e!685974)))

(declare-fun c!118869 () Bool)

(assert (=> b!1207772 (= c!118869 (validKeyInArray!0 (select (arr!37691 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!133341 (not res!802833)) b!1207772))

(assert (= (and b!1207772 c!118869) b!1207771))

(assert (= (and b!1207772 (not c!118869)) b!1207769))

(assert (= (and b!1207771 res!802834) b!1207770))

(assert (= (or b!1207770 b!1207769) bm!58795))

(declare-fun m!1113733 () Bool)

(assert (=> bm!58795 m!1113733))

(assert (=> b!1207771 m!1113697))

(declare-fun m!1113735 () Bool)

(assert (=> b!1207771 m!1113735))

(declare-fun m!1113737 () Bool)

(assert (=> b!1207771 m!1113737))

(assert (=> b!1207771 m!1113697))

(declare-fun m!1113739 () Bool)

(assert (=> b!1207771 m!1113739))

(assert (=> b!1207772 m!1113697))

(assert (=> b!1207772 m!1113697))

(assert (=> b!1207772 m!1113703))

(assert (=> b!1207520 d!133341))

(declare-fun d!133343 () Bool)

(declare-fun res!802839 () Bool)

(declare-fun e!685979 () Bool)

(assert (=> d!133343 (=> res!802839 e!685979)))

(assert (=> d!133343 (= res!802839 (= (select (arr!37691 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) k0!934))))

(assert (=> d!133343 (= (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)) e!685979)))

(declare-fun b!1207777 () Bool)

(declare-fun e!685980 () Bool)

(assert (=> b!1207777 (= e!685979 e!685980)))

(declare-fun res!802840 () Bool)

(assert (=> b!1207777 (=> (not res!802840) (not e!685980))))

(assert (=> b!1207777 (= res!802840 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38228 _keys!1208)))))

(declare-fun b!1207778 () Bool)

(assert (=> b!1207778 (= e!685980 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(assert (= (and d!133343 (not res!802839)) b!1207777))

(assert (= (and b!1207777 res!802840) b!1207778))

(assert (=> d!133343 m!1113709))

(declare-fun m!1113741 () Bool)

(assert (=> b!1207778 m!1113741))

(assert (=> b!1207512 d!133343))

(declare-fun b!1207779 () Bool)

(declare-fun e!685982 () ListLongMap!17721)

(declare-fun call!58799 () ListLongMap!17721)

(assert (=> b!1207779 (= e!685982 call!58799)))

(declare-fun b!1207780 () Bool)

(declare-fun e!685984 () Bool)

(declare-fun e!685986 () Bool)

(assert (=> b!1207780 (= e!685984 e!685986)))

(declare-fun c!118873 () Bool)

(declare-fun e!685981 () Bool)

(assert (=> b!1207780 (= c!118873 e!685981)))

(declare-fun res!802844 () Bool)

(assert (=> b!1207780 (=> (not res!802844) (not e!685981))))

(assert (=> b!1207780 (= res!802844 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38228 lt!547647)))))

(declare-fun b!1207781 () Bool)

(declare-fun e!685985 () ListLongMap!17721)

(assert (=> b!1207781 (= e!685985 e!685982)))

(declare-fun c!118871 () Bool)

(assert (=> b!1207781 (= c!118871 (validKeyInArray!0 (select (arr!37691 lt!547647) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1207782 () Bool)

(declare-fun e!685987 () Bool)

(declare-fun lt!547782 () ListLongMap!17721)

(assert (=> b!1207782 (= e!685987 (isEmpty!990 lt!547782))))

(declare-fun b!1207783 () Bool)

(declare-fun res!802842 () Bool)

(assert (=> b!1207783 (=> (not res!802842) (not e!685984))))

(assert (=> b!1207783 (= res!802842 (not (contains!6955 lt!547782 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!58796 () Bool)

(assert (=> bm!58796 (= call!58799 (getCurrentListMapNoExtraKeys!5338 lt!547647 lt!547639 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1207784 () Bool)

(assert (=> b!1207784 (= e!685987 (= lt!547782 (getCurrentListMapNoExtraKeys!5338 lt!547647 lt!547639 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1207785 () Bool)

(assert (=> b!1207785 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38228 lt!547647)))))

(assert (=> b!1207785 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38227 lt!547639)))))

(declare-fun e!685983 () Bool)

(assert (=> b!1207785 (= e!685983 (= (apply!973 lt!547782 (select (arr!37691 lt!547647) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19256 (select (arr!37690 lt!547639) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3261 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1207786 () Bool)

(declare-fun lt!547780 () Unit!39945)

(declare-fun lt!547779 () Unit!39945)

(assert (=> b!1207786 (= lt!547780 lt!547779)))

(declare-fun lt!547778 () (_ BitVec 64))

(declare-fun lt!547776 () (_ BitVec 64))

(declare-fun lt!547781 () ListLongMap!17721)

(declare-fun lt!547777 () V!45993)

(assert (=> b!1207786 (not (contains!6955 (+!4040 lt!547781 (tuple2!19745 lt!547776 lt!547777)) lt!547778))))

(assert (=> b!1207786 (= lt!547779 (addStillNotContains!294 lt!547781 lt!547776 lt!547777 lt!547778))))

(assert (=> b!1207786 (= lt!547778 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1207786 (= lt!547777 (get!19256 (select (arr!37690 lt!547639) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3261 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1207786 (= lt!547776 (select (arr!37691 lt!547647) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1207786 (= lt!547781 call!58799)))

(assert (=> b!1207786 (= e!685982 (+!4040 call!58799 (tuple2!19745 (select (arr!37691 lt!547647) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19256 (select (arr!37690 lt!547639) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3261 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1207787 () Bool)

(assert (=> b!1207787 (= e!685985 (ListLongMap!17722 Nil!26549))))

(declare-fun d!133345 () Bool)

(assert (=> d!133345 e!685984))

(declare-fun res!802843 () Bool)

(assert (=> d!133345 (=> (not res!802843) (not e!685984))))

(assert (=> d!133345 (= res!802843 (not (contains!6955 lt!547782 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133345 (= lt!547782 e!685985)))

(declare-fun c!118870 () Bool)

(assert (=> d!133345 (= c!118870 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38228 lt!547647)))))

(assert (=> d!133345 (validMask!0 mask!1564)))

(assert (=> d!133345 (= (getCurrentListMapNoExtraKeys!5338 lt!547647 lt!547639 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!547782)))

(declare-fun b!1207788 () Bool)

(assert (=> b!1207788 (= e!685986 e!685987)))

(declare-fun c!118872 () Bool)

(assert (=> b!1207788 (= c!118872 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38228 lt!547647)))))

(declare-fun b!1207789 () Bool)

(assert (=> b!1207789 (= e!685986 e!685983)))

(assert (=> b!1207789 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38228 lt!547647)))))

(declare-fun res!802841 () Bool)

(assert (=> b!1207789 (= res!802841 (contains!6955 lt!547782 (select (arr!37691 lt!547647) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1207789 (=> (not res!802841) (not e!685983))))

(declare-fun b!1207790 () Bool)

(assert (=> b!1207790 (= e!685981 (validKeyInArray!0 (select (arr!37691 lt!547647) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1207790 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(assert (= (and d!133345 c!118870) b!1207787))

(assert (= (and d!133345 (not c!118870)) b!1207781))

(assert (= (and b!1207781 c!118871) b!1207786))

(assert (= (and b!1207781 (not c!118871)) b!1207779))

(assert (= (or b!1207786 b!1207779) bm!58796))

(assert (= (and d!133345 res!802843) b!1207783))

(assert (= (and b!1207783 res!802842) b!1207780))

(assert (= (and b!1207780 res!802844) b!1207790))

(assert (= (and b!1207780 c!118873) b!1207789))

(assert (= (and b!1207780 (not c!118873)) b!1207788))

(assert (= (and b!1207789 res!802841) b!1207785))

(assert (= (and b!1207788 c!118872) b!1207784))

(assert (= (and b!1207788 (not c!118872)) b!1207782))

(declare-fun b_lambda!21355 () Bool)

(assert (=> (not b_lambda!21355) (not b!1207785)))

(assert (=> b!1207785 t!39468))

(declare-fun b_and!42895 () Bool)

(assert (= b_and!42893 (and (=> t!39468 result!22067) b_and!42895)))

(declare-fun b_lambda!21357 () Bool)

(assert (=> (not b_lambda!21357) (not b!1207786)))

(assert (=> b!1207786 t!39468))

(declare-fun b_and!42897 () Bool)

(assert (= b_and!42895 (and (=> t!39468 result!22067) b_and!42897)))

(declare-fun m!1113743 () Bool)

(assert (=> b!1207784 m!1113743))

(declare-fun m!1113745 () Bool)

(assert (=> d!133345 m!1113745))

(assert (=> d!133345 m!1113523))

(declare-fun m!1113747 () Bool)

(assert (=> b!1207781 m!1113747))

(assert (=> b!1207781 m!1113747))

(declare-fun m!1113749 () Bool)

(assert (=> b!1207781 m!1113749))

(assert (=> b!1207790 m!1113747))

(assert (=> b!1207790 m!1113747))

(assert (=> b!1207790 m!1113749))

(declare-fun m!1113751 () Bool)

(assert (=> b!1207783 m!1113751))

(declare-fun m!1113753 () Bool)

(assert (=> b!1207782 m!1113753))

(assert (=> b!1207789 m!1113747))

(assert (=> b!1207789 m!1113747))

(declare-fun m!1113755 () Bool)

(assert (=> b!1207789 m!1113755))

(declare-fun m!1113757 () Bool)

(assert (=> b!1207786 m!1113757))

(assert (=> b!1207786 m!1113513))

(declare-fun m!1113759 () Bool)

(assert (=> b!1207786 m!1113759))

(declare-fun m!1113761 () Bool)

(assert (=> b!1207786 m!1113761))

(declare-fun m!1113763 () Bool)

(assert (=> b!1207786 m!1113763))

(assert (=> b!1207786 m!1113763))

(declare-fun m!1113765 () Bool)

(assert (=> b!1207786 m!1113765))

(assert (=> b!1207786 m!1113757))

(assert (=> b!1207786 m!1113513))

(declare-fun m!1113767 () Bool)

(assert (=> b!1207786 m!1113767))

(assert (=> b!1207786 m!1113747))

(assert (=> b!1207785 m!1113757))

(assert (=> b!1207785 m!1113513))

(assert (=> b!1207785 m!1113759))

(assert (=> b!1207785 m!1113747))

(declare-fun m!1113769 () Bool)

(assert (=> b!1207785 m!1113769))

(assert (=> b!1207785 m!1113757))

(assert (=> b!1207785 m!1113747))

(assert (=> b!1207785 m!1113513))

(assert (=> bm!58796 m!1113743))

(assert (=> bm!58736 d!133345))

(declare-fun b!1207791 () Bool)

(declare-fun e!685991 () Bool)

(assert (=> b!1207791 (= e!685991 (contains!6958 Nil!26550 (select (arr!37691 _keys!1208) from!1455)))))

(declare-fun call!58800 () Bool)

(declare-fun c!118874 () Bool)

(declare-fun bm!58797 () Bool)

(assert (=> bm!58797 (= call!58800 (arrayNoDuplicates!0 _keys!1208 (bvadd from!1455 #b00000000000000000000000000000001) (ite c!118874 (Cons!26549 (select (arr!37691 _keys!1208) from!1455) Nil!26550) Nil!26550)))))

(declare-fun b!1207792 () Bool)

(declare-fun e!685988 () Bool)

(declare-fun e!685990 () Bool)

(assert (=> b!1207792 (= e!685988 e!685990)))

(declare-fun res!802846 () Bool)

(assert (=> b!1207792 (=> (not res!802846) (not e!685990))))

(assert (=> b!1207792 (= res!802846 (not e!685991))))

(declare-fun res!802847 () Bool)

(assert (=> b!1207792 (=> (not res!802847) (not e!685991))))

(assert (=> b!1207792 (= res!802847 (validKeyInArray!0 (select (arr!37691 _keys!1208) from!1455)))))

(declare-fun b!1207793 () Bool)

(declare-fun e!685989 () Bool)

(assert (=> b!1207793 (= e!685989 call!58800)))

(declare-fun d!133347 () Bool)

(declare-fun res!802845 () Bool)

(assert (=> d!133347 (=> res!802845 e!685988)))

(assert (=> d!133347 (= res!802845 (bvsge from!1455 (size!38228 _keys!1208)))))

(assert (=> d!133347 (= (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26550) e!685988)))

(declare-fun b!1207794 () Bool)

(assert (=> b!1207794 (= e!685990 e!685989)))

(assert (=> b!1207794 (= c!118874 (validKeyInArray!0 (select (arr!37691 _keys!1208) from!1455)))))

(declare-fun b!1207795 () Bool)

(assert (=> b!1207795 (= e!685989 call!58800)))

(assert (= (and d!133347 (not res!802845)) b!1207792))

(assert (= (and b!1207792 res!802847) b!1207791))

(assert (= (and b!1207792 res!802846) b!1207794))

(assert (= (and b!1207794 c!118874) b!1207793))

(assert (= (and b!1207794 (not c!118874)) b!1207795))

(assert (= (or b!1207793 b!1207795) bm!58797))

(assert (=> b!1207791 m!1113541))

(assert (=> b!1207791 m!1113541))

(declare-fun m!1113771 () Bool)

(assert (=> b!1207791 m!1113771))

(assert (=> bm!58797 m!1113541))

(declare-fun m!1113773 () Bool)

(assert (=> bm!58797 m!1113773))

(assert (=> b!1207792 m!1113541))

(assert (=> b!1207792 m!1113541))

(declare-fun m!1113775 () Bool)

(assert (=> b!1207792 m!1113775))

(assert (=> b!1207794 m!1113541))

(assert (=> b!1207794 m!1113541))

(assert (=> b!1207794 m!1113775))

(assert (=> b!1207535 d!133347))

(declare-fun d!133349 () Bool)

(assert (=> d!133349 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26550)))

(declare-fun lt!547785 () Unit!39945)

(declare-fun choose!39 (array!78113 (_ BitVec 32) (_ BitVec 32)) Unit!39945)

(assert (=> d!133349 (= lt!547785 (choose!39 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> d!133349 (bvslt (size!38228 _keys!1208) #b01111111111111111111111111111111)))

(assert (=> d!133349 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455) lt!547785)))

(declare-fun bs!34133 () Bool)

(assert (= bs!34133 d!133349))

(assert (=> bs!34133 m!1113529))

(declare-fun m!1113777 () Bool)

(assert (=> bs!34133 m!1113777))

(assert (=> b!1207535 d!133349))

(declare-fun d!133351 () Bool)

(declare-fun e!685994 () Bool)

(assert (=> d!133351 e!685994))

(declare-fun c!118877 () Bool)

(assert (=> d!133351 (= c!118877 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!547788 () Unit!39945)

(declare-fun choose!1803 (array!78113 array!78111 (_ BitVec 32) (_ BitVec 32) V!45993 V!45993 (_ BitVec 64) (_ BitVec 32) Int) Unit!39945)

(assert (=> d!133351 (= lt!547788 (choose!1803 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!133351 (validMask!0 mask!1564)))

(assert (=> d!133351 (= (lemmaListMapContainsThenArrayContainsFrom!577 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!547788)))

(declare-fun b!1207800 () Bool)

(assert (=> b!1207800 (= e!685994 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1207801 () Bool)

(assert (=> b!1207801 (= e!685994 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!133351 c!118877) b!1207800))

(assert (= (and d!133351 (not c!118877)) b!1207801))

(declare-fun m!1113779 () Bool)

(assert (=> d!133351 m!1113779))

(assert (=> d!133351 m!1113523))

(assert (=> b!1207800 m!1113503))

(assert (=> b!1207535 d!133351))

(declare-fun d!133353 () Bool)

(assert (=> d!133353 (contains!6955 (+!4040 lt!547645 (tuple2!19745 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934)))

(declare-fun lt!547791 () Unit!39945)

(declare-fun choose!1804 (ListLongMap!17721 (_ BitVec 64) V!45993 (_ BitVec 64)) Unit!39945)

(assert (=> d!133353 (= lt!547791 (choose!1804 lt!547645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> d!133353 (contains!6955 lt!547645 k0!934)))

(assert (=> d!133353 (= (addStillContains!1024 lt!547645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934) lt!547791)))

(declare-fun bs!34134 () Bool)

(assert (= bs!34134 d!133353))

(declare-fun m!1113781 () Bool)

(assert (=> bs!34134 m!1113781))

(assert (=> bs!34134 m!1113781))

(declare-fun m!1113783 () Bool)

(assert (=> bs!34134 m!1113783))

(declare-fun m!1113785 () Bool)

(assert (=> bs!34134 m!1113785))

(assert (=> bs!34134 m!1113557))

(assert (=> b!1207528 d!133353))

(declare-fun d!133355 () Bool)

(declare-fun e!685999 () Bool)

(assert (=> d!133355 e!685999))

(declare-fun res!802850 () Bool)

(assert (=> d!133355 (=> res!802850 e!685999)))

(declare-fun lt!547800 () Bool)

(assert (=> d!133355 (= res!802850 (not lt!547800))))

(declare-fun lt!547802 () Bool)

(assert (=> d!133355 (= lt!547800 lt!547802)))

(declare-fun lt!547801 () Unit!39945)

(declare-fun e!686000 () Unit!39945)

(assert (=> d!133355 (= lt!547801 e!686000)))

(declare-fun c!118880 () Bool)

(assert (=> d!133355 (= c!118880 lt!547802)))

(declare-fun containsKey!593 (List!26552 (_ BitVec 64)) Bool)

(assert (=> d!133355 (= lt!547802 (containsKey!593 (toList!8876 (+!4040 lt!547638 (tuple2!19745 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(assert (=> d!133355 (= (contains!6955 (+!4040 lt!547638 (tuple2!19745 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934) lt!547800)))

(declare-fun b!1207809 () Bool)

(declare-fun lt!547803 () Unit!39945)

(assert (=> b!1207809 (= e!686000 lt!547803)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!421 (List!26552 (_ BitVec 64)) Unit!39945)

(assert (=> b!1207809 (= lt!547803 (lemmaContainsKeyImpliesGetValueByKeyDefined!421 (toList!8876 (+!4040 lt!547638 (tuple2!19745 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(declare-datatypes ((Option!682 0))(
  ( (Some!681 (v!18024 V!45993)) (None!680) )
))
(declare-fun isDefined!459 (Option!682) Bool)

(declare-fun getValueByKey!631 (List!26552 (_ BitVec 64)) Option!682)

(assert (=> b!1207809 (isDefined!459 (getValueByKey!631 (toList!8876 (+!4040 lt!547638 (tuple2!19745 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(declare-fun b!1207810 () Bool)

(declare-fun Unit!39954 () Unit!39945)

(assert (=> b!1207810 (= e!686000 Unit!39954)))

(declare-fun b!1207811 () Bool)

(assert (=> b!1207811 (= e!685999 (isDefined!459 (getValueByKey!631 (toList!8876 (+!4040 lt!547638 (tuple2!19745 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934)))))

(assert (= (and d!133355 c!118880) b!1207809))

(assert (= (and d!133355 (not c!118880)) b!1207810))

(assert (= (and d!133355 (not res!802850)) b!1207811))

(declare-fun m!1113787 () Bool)

(assert (=> d!133355 m!1113787))

(declare-fun m!1113789 () Bool)

(assert (=> b!1207809 m!1113789))

(declare-fun m!1113791 () Bool)

(assert (=> b!1207809 m!1113791))

(assert (=> b!1207809 m!1113791))

(declare-fun m!1113793 () Bool)

(assert (=> b!1207809 m!1113793))

(assert (=> b!1207811 m!1113791))

(assert (=> b!1207811 m!1113791))

(assert (=> b!1207811 m!1113793))

(assert (=> b!1207528 d!133355))

(declare-fun d!133357 () Bool)

(declare-fun e!686003 () Bool)

(assert (=> d!133357 e!686003))

(declare-fun res!802855 () Bool)

(assert (=> d!133357 (=> (not res!802855) (not e!686003))))

(declare-fun lt!547814 () ListLongMap!17721)

(assert (=> d!133357 (= res!802855 (contains!6955 lt!547814 (_1!9883 (tuple2!19745 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun lt!547815 () List!26552)

(assert (=> d!133357 (= lt!547814 (ListLongMap!17722 lt!547815))))

(declare-fun lt!547813 () Unit!39945)

(declare-fun lt!547812 () Unit!39945)

(assert (=> d!133357 (= lt!547813 lt!547812)))

(assert (=> d!133357 (= (getValueByKey!631 lt!547815 (_1!9883 (tuple2!19745 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (Some!681 (_2!9883 (tuple2!19745 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun lemmaContainsTupThenGetReturnValue!313 (List!26552 (_ BitVec 64) V!45993) Unit!39945)

(assert (=> d!133357 (= lt!547812 (lemmaContainsTupThenGetReturnValue!313 lt!547815 (_1!9883 (tuple2!19745 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9883 (tuple2!19745 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun insertStrictlySorted!406 (List!26552 (_ BitVec 64) V!45993) List!26552)

(assert (=> d!133357 (= lt!547815 (insertStrictlySorted!406 (toList!8876 lt!547638) (_1!9883 (tuple2!19745 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9883 (tuple2!19745 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (=> d!133357 (= (+!4040 lt!547638 (tuple2!19745 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) lt!547814)))

(declare-fun b!1207816 () Bool)

(declare-fun res!802856 () Bool)

(assert (=> b!1207816 (=> (not res!802856) (not e!686003))))

(assert (=> b!1207816 (= res!802856 (= (getValueByKey!631 (toList!8876 lt!547814) (_1!9883 (tuple2!19745 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (Some!681 (_2!9883 (tuple2!19745 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1207817 () Bool)

(declare-fun contains!6959 (List!26552 tuple2!19744) Bool)

(assert (=> b!1207817 (= e!686003 (contains!6959 (toList!8876 lt!547814) (tuple2!19745 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))

(assert (= (and d!133357 res!802855) b!1207816))

(assert (= (and b!1207816 res!802856) b!1207817))

(declare-fun m!1113795 () Bool)

(assert (=> d!133357 m!1113795))

(declare-fun m!1113797 () Bool)

(assert (=> d!133357 m!1113797))

(declare-fun m!1113799 () Bool)

(assert (=> d!133357 m!1113799))

(declare-fun m!1113801 () Bool)

(assert (=> d!133357 m!1113801))

(declare-fun m!1113803 () Bool)

(assert (=> b!1207816 m!1113803))

(declare-fun m!1113805 () Bool)

(assert (=> b!1207817 m!1113805))

(assert (=> b!1207528 d!133357))

(declare-fun d!133359 () Bool)

(declare-fun e!686004 () Bool)

(assert (=> d!133359 e!686004))

(declare-fun res!802857 () Bool)

(assert (=> d!133359 (=> res!802857 e!686004)))

(declare-fun lt!547816 () Bool)

(assert (=> d!133359 (= res!802857 (not lt!547816))))

(declare-fun lt!547818 () Bool)

(assert (=> d!133359 (= lt!547816 lt!547818)))

(declare-fun lt!547817 () Unit!39945)

(declare-fun e!686005 () Unit!39945)

(assert (=> d!133359 (= lt!547817 e!686005)))

(declare-fun c!118881 () Bool)

(assert (=> d!133359 (= c!118881 lt!547818)))

(assert (=> d!133359 (= lt!547818 (containsKey!593 (toList!8876 (ite c!118820 lt!547638 call!58739)) k0!934))))

(assert (=> d!133359 (= (contains!6955 (ite c!118820 lt!547638 call!58739) k0!934) lt!547816)))

(declare-fun b!1207818 () Bool)

(declare-fun lt!547819 () Unit!39945)

(assert (=> b!1207818 (= e!686005 lt!547819)))

(assert (=> b!1207818 (= lt!547819 (lemmaContainsKeyImpliesGetValueByKeyDefined!421 (toList!8876 (ite c!118820 lt!547638 call!58739)) k0!934))))

(assert (=> b!1207818 (isDefined!459 (getValueByKey!631 (toList!8876 (ite c!118820 lt!547638 call!58739)) k0!934))))

(declare-fun b!1207819 () Bool)

(declare-fun Unit!39955 () Unit!39945)

(assert (=> b!1207819 (= e!686005 Unit!39955)))

(declare-fun b!1207820 () Bool)

(assert (=> b!1207820 (= e!686004 (isDefined!459 (getValueByKey!631 (toList!8876 (ite c!118820 lt!547638 call!58739)) k0!934)))))

(assert (= (and d!133359 c!118881) b!1207818))

(assert (= (and d!133359 (not c!118881)) b!1207819))

(assert (= (and d!133359 (not res!802857)) b!1207820))

(declare-fun m!1113807 () Bool)

(assert (=> d!133359 m!1113807))

(declare-fun m!1113809 () Bool)

(assert (=> b!1207818 m!1113809))

(declare-fun m!1113811 () Bool)

(assert (=> b!1207818 m!1113811))

(assert (=> b!1207818 m!1113811))

(declare-fun m!1113813 () Bool)

(assert (=> b!1207818 m!1113813))

(assert (=> b!1207820 m!1113811))

(assert (=> b!1207820 m!1113811))

(assert (=> b!1207820 m!1113813))

(assert (=> bm!58734 d!133359))

(declare-fun d!133361 () Bool)

(declare-fun e!686006 () Bool)

(assert (=> d!133361 e!686006))

(declare-fun res!802858 () Bool)

(assert (=> d!133361 (=> res!802858 e!686006)))

(declare-fun lt!547820 () Bool)

(assert (=> d!133361 (= res!802858 (not lt!547820))))

(declare-fun lt!547822 () Bool)

(assert (=> d!133361 (= lt!547820 lt!547822)))

(declare-fun lt!547821 () Unit!39945)

(declare-fun e!686007 () Unit!39945)

(assert (=> d!133361 (= lt!547821 e!686007)))

(declare-fun c!118882 () Bool)

(assert (=> d!133361 (= c!118882 lt!547822)))

(assert (=> d!133361 (= lt!547822 (containsKey!593 (toList!8876 lt!547645) k0!934))))

(assert (=> d!133361 (= (contains!6955 lt!547645 k0!934) lt!547820)))

(declare-fun b!1207821 () Bool)

(declare-fun lt!547823 () Unit!39945)

(assert (=> b!1207821 (= e!686007 lt!547823)))

(assert (=> b!1207821 (= lt!547823 (lemmaContainsKeyImpliesGetValueByKeyDefined!421 (toList!8876 lt!547645) k0!934))))

(assert (=> b!1207821 (isDefined!459 (getValueByKey!631 (toList!8876 lt!547645) k0!934))))

(declare-fun b!1207822 () Bool)

(declare-fun Unit!39956 () Unit!39945)

(assert (=> b!1207822 (= e!686007 Unit!39956)))

(declare-fun b!1207823 () Bool)

(assert (=> b!1207823 (= e!686006 (isDefined!459 (getValueByKey!631 (toList!8876 lt!547645) k0!934)))))

(assert (= (and d!133361 c!118882) b!1207821))

(assert (= (and d!133361 (not c!118882)) b!1207822))

(assert (= (and d!133361 (not res!802858)) b!1207823))

(declare-fun m!1113815 () Bool)

(assert (=> d!133361 m!1113815))

(declare-fun m!1113817 () Bool)

(assert (=> b!1207821 m!1113817))

(declare-fun m!1113819 () Bool)

(assert (=> b!1207821 m!1113819))

(assert (=> b!1207821 m!1113819))

(declare-fun m!1113821 () Bool)

(assert (=> b!1207821 m!1113821))

(assert (=> b!1207823 m!1113819))

(assert (=> b!1207823 m!1113819))

(assert (=> b!1207823 m!1113821))

(assert (=> b!1207510 d!133361))

(assert (=> b!1207510 d!133339))

(declare-fun d!133363 () Bool)

(declare-fun lt!547826 () ListLongMap!17721)

(assert (=> d!133363 (not (contains!6955 lt!547826 k0!934))))

(declare-fun removeStrictlySorted!96 (List!26552 (_ BitVec 64)) List!26552)

(assert (=> d!133363 (= lt!547826 (ListLongMap!17722 (removeStrictlySorted!96 (toList!8876 call!58734) k0!934)))))

(assert (=> d!133363 (= (-!1818 call!58734 k0!934) lt!547826)))

(declare-fun bs!34135 () Bool)

(assert (= bs!34135 d!133363))

(declare-fun m!1113823 () Bool)

(assert (=> bs!34135 m!1113823))

(declare-fun m!1113825 () Bool)

(assert (=> bs!34135 m!1113825))

(assert (=> b!1207534 d!133363))

(declare-fun d!133365 () Bool)

(assert (=> d!133365 (= (array_inv!28778 _keys!1208) (bvsge (size!38228 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!101010 d!133365))

(declare-fun d!133367 () Bool)

(assert (=> d!133367 (= (array_inv!28779 _values!996) (bvsge (size!38227 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!101010 d!133367))

(declare-fun b!1207824 () Bool)

(declare-fun e!686009 () ListLongMap!17721)

(declare-fun call!58801 () ListLongMap!17721)

(assert (=> b!1207824 (= e!686009 call!58801)))

(declare-fun b!1207825 () Bool)

(declare-fun e!686011 () Bool)

(declare-fun e!686013 () Bool)

(assert (=> b!1207825 (= e!686011 e!686013)))

(declare-fun c!118886 () Bool)

(declare-fun e!686008 () Bool)

(assert (=> b!1207825 (= c!118886 e!686008)))

(declare-fun res!802862 () Bool)

(assert (=> b!1207825 (=> (not res!802862) (not e!686008))))

(assert (=> b!1207825 (= res!802862 (bvslt from!1455 (size!38228 lt!547647)))))

(declare-fun b!1207826 () Bool)

(declare-fun e!686012 () ListLongMap!17721)

(assert (=> b!1207826 (= e!686012 e!686009)))

(declare-fun c!118884 () Bool)

(assert (=> b!1207826 (= c!118884 (validKeyInArray!0 (select (arr!37691 lt!547647) from!1455)))))

(declare-fun b!1207827 () Bool)

(declare-fun e!686014 () Bool)

(declare-fun lt!547833 () ListLongMap!17721)

(assert (=> b!1207827 (= e!686014 (isEmpty!990 lt!547833))))

(declare-fun b!1207828 () Bool)

(declare-fun res!802860 () Bool)

(assert (=> b!1207828 (=> (not res!802860) (not e!686011))))

(assert (=> b!1207828 (= res!802860 (not (contains!6955 lt!547833 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!58798 () Bool)

(assert (=> bm!58798 (= call!58801 (getCurrentListMapNoExtraKeys!5338 lt!547647 lt!547639 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1207829 () Bool)

(assert (=> b!1207829 (= e!686014 (= lt!547833 (getCurrentListMapNoExtraKeys!5338 lt!547647 lt!547639 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1207830 () Bool)

(assert (=> b!1207830 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38228 lt!547647)))))

(assert (=> b!1207830 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38227 lt!547639)))))

(declare-fun e!686010 () Bool)

(assert (=> b!1207830 (= e!686010 (= (apply!973 lt!547833 (select (arr!37691 lt!547647) from!1455)) (get!19256 (select (arr!37690 lt!547639) from!1455) (dynLambda!3261 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1207831 () Bool)

(declare-fun lt!547831 () Unit!39945)

(declare-fun lt!547830 () Unit!39945)

(assert (=> b!1207831 (= lt!547831 lt!547830)))

(declare-fun lt!547828 () V!45993)

(declare-fun lt!547832 () ListLongMap!17721)

(declare-fun lt!547827 () (_ BitVec 64))

(declare-fun lt!547829 () (_ BitVec 64))

(assert (=> b!1207831 (not (contains!6955 (+!4040 lt!547832 (tuple2!19745 lt!547827 lt!547828)) lt!547829))))

(assert (=> b!1207831 (= lt!547830 (addStillNotContains!294 lt!547832 lt!547827 lt!547828 lt!547829))))

(assert (=> b!1207831 (= lt!547829 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1207831 (= lt!547828 (get!19256 (select (arr!37690 lt!547639) from!1455) (dynLambda!3261 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1207831 (= lt!547827 (select (arr!37691 lt!547647) from!1455))))

(assert (=> b!1207831 (= lt!547832 call!58801)))

(assert (=> b!1207831 (= e!686009 (+!4040 call!58801 (tuple2!19745 (select (arr!37691 lt!547647) from!1455) (get!19256 (select (arr!37690 lt!547639) from!1455) (dynLambda!3261 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1207832 () Bool)

(assert (=> b!1207832 (= e!686012 (ListLongMap!17722 Nil!26549))))

(declare-fun d!133369 () Bool)

(assert (=> d!133369 e!686011))

(declare-fun res!802861 () Bool)

(assert (=> d!133369 (=> (not res!802861) (not e!686011))))

(assert (=> d!133369 (= res!802861 (not (contains!6955 lt!547833 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133369 (= lt!547833 e!686012)))

(declare-fun c!118883 () Bool)

(assert (=> d!133369 (= c!118883 (bvsge from!1455 (size!38228 lt!547647)))))

(assert (=> d!133369 (validMask!0 mask!1564)))

(assert (=> d!133369 (= (getCurrentListMapNoExtraKeys!5338 lt!547647 lt!547639 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!547833)))

(declare-fun b!1207833 () Bool)

(assert (=> b!1207833 (= e!686013 e!686014)))

(declare-fun c!118885 () Bool)

(assert (=> b!1207833 (= c!118885 (bvslt from!1455 (size!38228 lt!547647)))))

(declare-fun b!1207834 () Bool)

(assert (=> b!1207834 (= e!686013 e!686010)))

(assert (=> b!1207834 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38228 lt!547647)))))

(declare-fun res!802859 () Bool)

(assert (=> b!1207834 (= res!802859 (contains!6955 lt!547833 (select (arr!37691 lt!547647) from!1455)))))

(assert (=> b!1207834 (=> (not res!802859) (not e!686010))))

(declare-fun b!1207835 () Bool)

(assert (=> b!1207835 (= e!686008 (validKeyInArray!0 (select (arr!37691 lt!547647) from!1455)))))

(assert (=> b!1207835 (bvsge from!1455 #b00000000000000000000000000000000)))

(assert (= (and d!133369 c!118883) b!1207832))

(assert (= (and d!133369 (not c!118883)) b!1207826))

(assert (= (and b!1207826 c!118884) b!1207831))

(assert (= (and b!1207826 (not c!118884)) b!1207824))

(assert (= (or b!1207831 b!1207824) bm!58798))

(assert (= (and d!133369 res!802861) b!1207828))

(assert (= (and b!1207828 res!802860) b!1207825))

(assert (= (and b!1207825 res!802862) b!1207835))

(assert (= (and b!1207825 c!118886) b!1207834))

(assert (= (and b!1207825 (not c!118886)) b!1207833))

(assert (= (and b!1207834 res!802859) b!1207830))

(assert (= (and b!1207833 c!118885) b!1207829))

(assert (= (and b!1207833 (not c!118885)) b!1207827))

(declare-fun b_lambda!21359 () Bool)

(assert (=> (not b_lambda!21359) (not b!1207830)))

(assert (=> b!1207830 t!39468))

(declare-fun b_and!42899 () Bool)

(assert (= b_and!42897 (and (=> t!39468 result!22067) b_and!42899)))

(declare-fun b_lambda!21361 () Bool)

(assert (=> (not b_lambda!21361) (not b!1207831)))

(assert (=> b!1207831 t!39468))

(declare-fun b_and!42901 () Bool)

(assert (= b_and!42899 (and (=> t!39468 result!22067) b_and!42901)))

(declare-fun m!1113827 () Bool)

(assert (=> b!1207829 m!1113827))

(declare-fun m!1113829 () Bool)

(assert (=> d!133369 m!1113829))

(assert (=> d!133369 m!1113523))

(declare-fun m!1113831 () Bool)

(assert (=> b!1207826 m!1113831))

(assert (=> b!1207826 m!1113831))

(declare-fun m!1113833 () Bool)

(assert (=> b!1207826 m!1113833))

(assert (=> b!1207835 m!1113831))

(assert (=> b!1207835 m!1113831))

(assert (=> b!1207835 m!1113833))

(declare-fun m!1113835 () Bool)

(assert (=> b!1207828 m!1113835))

(declare-fun m!1113837 () Bool)

(assert (=> b!1207827 m!1113837))

(assert (=> b!1207834 m!1113831))

(assert (=> b!1207834 m!1113831))

(declare-fun m!1113839 () Bool)

(assert (=> b!1207834 m!1113839))

(declare-fun m!1113841 () Bool)

(assert (=> b!1207831 m!1113841))

(assert (=> b!1207831 m!1113513))

(declare-fun m!1113843 () Bool)

(assert (=> b!1207831 m!1113843))

(declare-fun m!1113845 () Bool)

(assert (=> b!1207831 m!1113845))

(declare-fun m!1113847 () Bool)

(assert (=> b!1207831 m!1113847))

(assert (=> b!1207831 m!1113847))

(declare-fun m!1113849 () Bool)

(assert (=> b!1207831 m!1113849))

(assert (=> b!1207831 m!1113841))

(assert (=> b!1207831 m!1113513))

(declare-fun m!1113851 () Bool)

(assert (=> b!1207831 m!1113851))

(assert (=> b!1207831 m!1113831))

(assert (=> b!1207830 m!1113841))

(assert (=> b!1207830 m!1113513))

(assert (=> b!1207830 m!1113843))

(assert (=> b!1207830 m!1113831))

(declare-fun m!1113853 () Bool)

(assert (=> b!1207830 m!1113853))

(assert (=> b!1207830 m!1113841))

(assert (=> b!1207830 m!1113831))

(assert (=> b!1207830 m!1113513))

(assert (=> bm!58798 m!1113827))

(assert (=> b!1207533 d!133369))

(declare-fun b!1207836 () Bool)

(declare-fun e!686016 () ListLongMap!17721)

(declare-fun call!58802 () ListLongMap!17721)

(assert (=> b!1207836 (= e!686016 call!58802)))

(declare-fun b!1207837 () Bool)

(declare-fun e!686018 () Bool)

(declare-fun e!686020 () Bool)

(assert (=> b!1207837 (= e!686018 e!686020)))

(declare-fun c!118890 () Bool)

(declare-fun e!686015 () Bool)

(assert (=> b!1207837 (= c!118890 e!686015)))

(declare-fun res!802866 () Bool)

(assert (=> b!1207837 (=> (not res!802866) (not e!686015))))

(assert (=> b!1207837 (= res!802866 (bvslt from!1455 (size!38228 _keys!1208)))))

(declare-fun b!1207838 () Bool)

(declare-fun e!686019 () ListLongMap!17721)

(assert (=> b!1207838 (= e!686019 e!686016)))

(declare-fun c!118888 () Bool)

(assert (=> b!1207838 (= c!118888 (validKeyInArray!0 (select (arr!37691 _keys!1208) from!1455)))))

(declare-fun b!1207839 () Bool)

(declare-fun e!686021 () Bool)

(declare-fun lt!547840 () ListLongMap!17721)

(assert (=> b!1207839 (= e!686021 (isEmpty!990 lt!547840))))

(declare-fun b!1207840 () Bool)

(declare-fun res!802864 () Bool)

(assert (=> b!1207840 (=> (not res!802864) (not e!686018))))

(assert (=> b!1207840 (= res!802864 (not (contains!6955 lt!547840 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!58799 () Bool)

(assert (=> bm!58799 (= call!58802 (getCurrentListMapNoExtraKeys!5338 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1207841 () Bool)

(assert (=> b!1207841 (= e!686021 (= lt!547840 (getCurrentListMapNoExtraKeys!5338 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1207842 () Bool)

(assert (=> b!1207842 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38228 _keys!1208)))))

(assert (=> b!1207842 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38227 _values!996)))))

(declare-fun e!686017 () Bool)

(assert (=> b!1207842 (= e!686017 (= (apply!973 lt!547840 (select (arr!37691 _keys!1208) from!1455)) (get!19256 (select (arr!37690 _values!996) from!1455) (dynLambda!3261 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1207843 () Bool)

(declare-fun lt!547838 () Unit!39945)

(declare-fun lt!547837 () Unit!39945)

(assert (=> b!1207843 (= lt!547838 lt!547837)))

(declare-fun lt!547839 () ListLongMap!17721)

(declare-fun lt!547836 () (_ BitVec 64))

(declare-fun lt!547834 () (_ BitVec 64))

(declare-fun lt!547835 () V!45993)

(assert (=> b!1207843 (not (contains!6955 (+!4040 lt!547839 (tuple2!19745 lt!547834 lt!547835)) lt!547836))))

(assert (=> b!1207843 (= lt!547837 (addStillNotContains!294 lt!547839 lt!547834 lt!547835 lt!547836))))

(assert (=> b!1207843 (= lt!547836 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1207843 (= lt!547835 (get!19256 (select (arr!37690 _values!996) from!1455) (dynLambda!3261 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1207843 (= lt!547834 (select (arr!37691 _keys!1208) from!1455))))

(assert (=> b!1207843 (= lt!547839 call!58802)))

(assert (=> b!1207843 (= e!686016 (+!4040 call!58802 (tuple2!19745 (select (arr!37691 _keys!1208) from!1455) (get!19256 (select (arr!37690 _values!996) from!1455) (dynLambda!3261 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1207844 () Bool)

(assert (=> b!1207844 (= e!686019 (ListLongMap!17722 Nil!26549))))

(declare-fun d!133371 () Bool)

(assert (=> d!133371 e!686018))

(declare-fun res!802865 () Bool)

(assert (=> d!133371 (=> (not res!802865) (not e!686018))))

(assert (=> d!133371 (= res!802865 (not (contains!6955 lt!547840 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133371 (= lt!547840 e!686019)))

(declare-fun c!118887 () Bool)

(assert (=> d!133371 (= c!118887 (bvsge from!1455 (size!38228 _keys!1208)))))

(assert (=> d!133371 (validMask!0 mask!1564)))

(assert (=> d!133371 (= (getCurrentListMapNoExtraKeys!5338 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!547840)))

(declare-fun b!1207845 () Bool)

(assert (=> b!1207845 (= e!686020 e!686021)))

(declare-fun c!118889 () Bool)

(assert (=> b!1207845 (= c!118889 (bvslt from!1455 (size!38228 _keys!1208)))))

(declare-fun b!1207846 () Bool)

(assert (=> b!1207846 (= e!686020 e!686017)))

(assert (=> b!1207846 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38228 _keys!1208)))))

(declare-fun res!802863 () Bool)

(assert (=> b!1207846 (= res!802863 (contains!6955 lt!547840 (select (arr!37691 _keys!1208) from!1455)))))

(assert (=> b!1207846 (=> (not res!802863) (not e!686017))))

(declare-fun b!1207847 () Bool)

(assert (=> b!1207847 (= e!686015 (validKeyInArray!0 (select (arr!37691 _keys!1208) from!1455)))))

(assert (=> b!1207847 (bvsge from!1455 #b00000000000000000000000000000000)))

(assert (= (and d!133371 c!118887) b!1207844))

(assert (= (and d!133371 (not c!118887)) b!1207838))

(assert (= (and b!1207838 c!118888) b!1207843))

(assert (= (and b!1207838 (not c!118888)) b!1207836))

(assert (= (or b!1207843 b!1207836) bm!58799))

(assert (= (and d!133371 res!802865) b!1207840))

(assert (= (and b!1207840 res!802864) b!1207837))

(assert (= (and b!1207837 res!802866) b!1207847))

(assert (= (and b!1207837 c!118890) b!1207846))

(assert (= (and b!1207837 (not c!118890)) b!1207845))

(assert (= (and b!1207846 res!802863) b!1207842))

(assert (= (and b!1207845 c!118889) b!1207841))

(assert (= (and b!1207845 (not c!118889)) b!1207839))

(declare-fun b_lambda!21363 () Bool)

(assert (=> (not b_lambda!21363) (not b!1207842)))

(assert (=> b!1207842 t!39468))

(declare-fun b_and!42903 () Bool)

(assert (= b_and!42901 (and (=> t!39468 result!22067) b_and!42903)))

(declare-fun b_lambda!21365 () Bool)

(assert (=> (not b_lambda!21365) (not b!1207843)))

(assert (=> b!1207843 t!39468))

(declare-fun b_and!42905 () Bool)

(assert (= b_and!42903 (and (=> t!39468 result!22067) b_and!42905)))

(declare-fun m!1113855 () Bool)

(assert (=> b!1207841 m!1113855))

(declare-fun m!1113857 () Bool)

(assert (=> d!133371 m!1113857))

(assert (=> d!133371 m!1113523))

(assert (=> b!1207838 m!1113541))

(assert (=> b!1207838 m!1113541))

(assert (=> b!1207838 m!1113775))

(assert (=> b!1207847 m!1113541))

(assert (=> b!1207847 m!1113541))

(assert (=> b!1207847 m!1113775))

(declare-fun m!1113859 () Bool)

(assert (=> b!1207840 m!1113859))

(declare-fun m!1113861 () Bool)

(assert (=> b!1207839 m!1113861))

(assert (=> b!1207846 m!1113541))

(assert (=> b!1207846 m!1113541))

(declare-fun m!1113863 () Bool)

(assert (=> b!1207846 m!1113863))

(declare-fun m!1113865 () Bool)

(assert (=> b!1207843 m!1113865))

(assert (=> b!1207843 m!1113513))

(declare-fun m!1113867 () Bool)

(assert (=> b!1207843 m!1113867))

(declare-fun m!1113869 () Bool)

(assert (=> b!1207843 m!1113869))

(declare-fun m!1113871 () Bool)

(assert (=> b!1207843 m!1113871))

(assert (=> b!1207843 m!1113871))

(declare-fun m!1113873 () Bool)

(assert (=> b!1207843 m!1113873))

(assert (=> b!1207843 m!1113865))

(assert (=> b!1207843 m!1113513))

(declare-fun m!1113875 () Bool)

(assert (=> b!1207843 m!1113875))

(assert (=> b!1207843 m!1113541))

(assert (=> b!1207842 m!1113865))

(assert (=> b!1207842 m!1113513))

(assert (=> b!1207842 m!1113867))

(assert (=> b!1207842 m!1113541))

(declare-fun m!1113877 () Bool)

(assert (=> b!1207842 m!1113877))

(assert (=> b!1207842 m!1113865))

(assert (=> b!1207842 m!1113541))

(assert (=> b!1207842 m!1113513))

(assert (=> bm!58799 m!1113855))

(assert (=> b!1207533 d!133371))

(declare-fun b!1207848 () Bool)

(declare-fun e!686025 () Bool)

(assert (=> b!1207848 (= e!686025 (contains!6958 Nil!26550 (select (arr!37691 lt!547647) #b00000000000000000000000000000000)))))

(declare-fun bm!58800 () Bool)

(declare-fun call!58803 () Bool)

(declare-fun c!118891 () Bool)

(assert (=> bm!58800 (= call!58803 (arrayNoDuplicates!0 lt!547647 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!118891 (Cons!26549 (select (arr!37691 lt!547647) #b00000000000000000000000000000000) Nil!26550) Nil!26550)))))

(declare-fun b!1207849 () Bool)

(declare-fun e!686022 () Bool)

(declare-fun e!686024 () Bool)

(assert (=> b!1207849 (= e!686022 e!686024)))

(declare-fun res!802868 () Bool)

(assert (=> b!1207849 (=> (not res!802868) (not e!686024))))

(assert (=> b!1207849 (= res!802868 (not e!686025))))

(declare-fun res!802869 () Bool)

(assert (=> b!1207849 (=> (not res!802869) (not e!686025))))

(assert (=> b!1207849 (= res!802869 (validKeyInArray!0 (select (arr!37691 lt!547647) #b00000000000000000000000000000000)))))

(declare-fun b!1207850 () Bool)

(declare-fun e!686023 () Bool)

(assert (=> b!1207850 (= e!686023 call!58803)))

(declare-fun d!133373 () Bool)

(declare-fun res!802867 () Bool)

(assert (=> d!133373 (=> res!802867 e!686022)))

(assert (=> d!133373 (= res!802867 (bvsge #b00000000000000000000000000000000 (size!38228 lt!547647)))))

(assert (=> d!133373 (= (arrayNoDuplicates!0 lt!547647 #b00000000000000000000000000000000 Nil!26550) e!686022)))

(declare-fun b!1207851 () Bool)

(assert (=> b!1207851 (= e!686024 e!686023)))

(assert (=> b!1207851 (= c!118891 (validKeyInArray!0 (select (arr!37691 lt!547647) #b00000000000000000000000000000000)))))

(declare-fun b!1207852 () Bool)

(assert (=> b!1207852 (= e!686023 call!58803)))

(assert (= (and d!133373 (not res!802867)) b!1207849))

(assert (= (and b!1207849 res!802869) b!1207848))

(assert (= (and b!1207849 res!802868) b!1207851))

(assert (= (and b!1207851 c!118891) b!1207850))

(assert (= (and b!1207851 (not c!118891)) b!1207852))

(assert (= (or b!1207850 b!1207852) bm!58800))

(declare-fun m!1113879 () Bool)

(assert (=> b!1207848 m!1113879))

(assert (=> b!1207848 m!1113879))

(declare-fun m!1113881 () Bool)

(assert (=> b!1207848 m!1113881))

(assert (=> bm!58800 m!1113879))

(declare-fun m!1113883 () Bool)

(assert (=> bm!58800 m!1113883))

(assert (=> b!1207849 m!1113879))

(assert (=> b!1207849 m!1113879))

(declare-fun m!1113885 () Bool)

(assert (=> b!1207849 m!1113885))

(assert (=> b!1207851 m!1113879))

(assert (=> b!1207851 m!1113879))

(assert (=> b!1207851 m!1113885))

(assert (=> b!1207525 d!133373))

(declare-fun call!58808 () ListLongMap!17721)

(declare-fun bm!58805 () Bool)

(assert (=> bm!58805 (= call!58808 (getCurrentListMapNoExtraKeys!5338 (array!78114 (store (arr!37691 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38228 _keys!1208)) (array!78112 (store (arr!37690 _values!996) i!673 (ValueCellFull!14615 (dynLambda!3261 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38227 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1207859 () Bool)

(declare-fun call!58809 () ListLongMap!17721)

(declare-fun e!686031 () Bool)

(assert (=> b!1207859 (= e!686031 (= call!58808 (-!1818 call!58809 k0!934)))))

(assert (=> b!1207859 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38227 _values!996)))))

(declare-fun b!1207860 () Bool)

(declare-fun e!686030 () Bool)

(assert (=> b!1207860 (= e!686030 e!686031)))

(declare-fun c!118894 () Bool)

(assert (=> b!1207860 (= c!118894 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun bm!58806 () Bool)

(assert (=> bm!58806 (= call!58809 (getCurrentListMapNoExtraKeys!5338 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun d!133375 () Bool)

(assert (=> d!133375 e!686030))

(declare-fun res!802872 () Bool)

(assert (=> d!133375 (=> (not res!802872) (not e!686030))))

(assert (=> d!133375 (= res!802872 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38228 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38228 _keys!1208))))))))

(declare-fun lt!547843 () Unit!39945)

(declare-fun choose!1805 (array!78113 array!78111 (_ BitVec 32) (_ BitVec 32) V!45993 V!45993 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39945)

(assert (=> d!133375 (= lt!547843 (choose!1805 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!133375 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38228 _keys!1208)))))

(assert (=> d!133375 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1036 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!547843)))

(declare-fun b!1207861 () Bool)

(assert (=> b!1207861 (= e!686031 (= call!58808 call!58809))))

(assert (=> b!1207861 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38227 _values!996)))))

(assert (= (and d!133375 res!802872) b!1207860))

(assert (= (and b!1207860 c!118894) b!1207859))

(assert (= (and b!1207860 (not c!118894)) b!1207861))

(assert (= (or b!1207859 b!1207861) bm!58806))

(assert (= (or b!1207859 b!1207861) bm!58805))

(declare-fun b_lambda!21367 () Bool)

(assert (=> (not b_lambda!21367) (not bm!58805)))

(assert (=> bm!58805 t!39468))

(declare-fun b_and!42907 () Bool)

(assert (= b_and!42905 (and (=> t!39468 result!22067) b_and!42907)))

(assert (=> bm!58805 m!1113501))

(assert (=> bm!58805 m!1113513))

(assert (=> bm!58805 m!1113515))

(declare-fun m!1113887 () Bool)

(assert (=> bm!58805 m!1113887))

(declare-fun m!1113889 () Bool)

(assert (=> b!1207859 m!1113889))

(assert (=> bm!58806 m!1113509))

(declare-fun m!1113891 () Bool)

(assert (=> d!133375 m!1113891))

(assert (=> b!1207517 d!133375))

(declare-fun d!133377 () Bool)

(assert (=> d!133377 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1207532 d!133377))

(declare-fun d!133379 () Bool)

(declare-fun e!686032 () Bool)

(assert (=> d!133379 e!686032))

(declare-fun res!802873 () Bool)

(assert (=> d!133379 (=> (not res!802873) (not e!686032))))

(declare-fun lt!547846 () ListLongMap!17721)

(assert (=> d!133379 (= res!802873 (contains!6955 lt!547846 (_1!9883 (ite (or c!118820 c!118818) (tuple2!19745 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19745 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun lt!547847 () List!26552)

(assert (=> d!133379 (= lt!547846 (ListLongMap!17722 lt!547847))))

(declare-fun lt!547845 () Unit!39945)

(declare-fun lt!547844 () Unit!39945)

(assert (=> d!133379 (= lt!547845 lt!547844)))

(assert (=> d!133379 (= (getValueByKey!631 lt!547847 (_1!9883 (ite (or c!118820 c!118818) (tuple2!19745 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19745 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (Some!681 (_2!9883 (ite (or c!118820 c!118818) (tuple2!19745 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19745 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!133379 (= lt!547844 (lemmaContainsTupThenGetReturnValue!313 lt!547847 (_1!9883 (ite (or c!118820 c!118818) (tuple2!19745 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19745 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9883 (ite (or c!118820 c!118818) (tuple2!19745 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19745 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!133379 (= lt!547847 (insertStrictlySorted!406 (toList!8876 lt!547645) (_1!9883 (ite (or c!118820 c!118818) (tuple2!19745 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19745 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9883 (ite (or c!118820 c!118818) (tuple2!19745 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19745 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!133379 (= (+!4040 lt!547645 (ite (or c!118820 c!118818) (tuple2!19745 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19745 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) lt!547846)))

(declare-fun b!1207862 () Bool)

(declare-fun res!802874 () Bool)

(assert (=> b!1207862 (=> (not res!802874) (not e!686032))))

(assert (=> b!1207862 (= res!802874 (= (getValueByKey!631 (toList!8876 lt!547846) (_1!9883 (ite (or c!118820 c!118818) (tuple2!19745 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19745 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (Some!681 (_2!9883 (ite (or c!118820 c!118818) (tuple2!19745 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19745 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun b!1207863 () Bool)

(assert (=> b!1207863 (= e!686032 (contains!6959 (toList!8876 lt!547846) (ite (or c!118820 c!118818) (tuple2!19745 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19745 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (= (and d!133379 res!802873) b!1207862))

(assert (= (and b!1207862 res!802874) b!1207863))

(declare-fun m!1113893 () Bool)

(assert (=> d!133379 m!1113893))

(declare-fun m!1113895 () Bool)

(assert (=> d!133379 m!1113895))

(declare-fun m!1113897 () Bool)

(assert (=> d!133379 m!1113897))

(declare-fun m!1113899 () Bool)

(assert (=> d!133379 m!1113899))

(declare-fun m!1113901 () Bool)

(assert (=> b!1207862 m!1113901))

(declare-fun m!1113903 () Bool)

(assert (=> b!1207863 m!1113903))

(assert (=> bm!58735 d!133379))

(declare-fun d!133381 () Bool)

(assert (=> d!133381 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1207516 d!133381))

(declare-fun d!133383 () Bool)

(assert (=> d!133383 (contains!6955 (+!4040 (ite c!118820 lt!547638 lt!547645) (tuple2!19745 (ite c!118820 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118818 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118820 minValue!944 (ite c!118818 zeroValue!944 minValue!944)))) k0!934)))

(declare-fun lt!547848 () Unit!39945)

(assert (=> d!133383 (= lt!547848 (choose!1804 (ite c!118820 lt!547638 lt!547645) (ite c!118820 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118818 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118820 minValue!944 (ite c!118818 zeroValue!944 minValue!944)) k0!934))))

(assert (=> d!133383 (contains!6955 (ite c!118820 lt!547638 lt!547645) k0!934)))

(assert (=> d!133383 (= (addStillContains!1024 (ite c!118820 lt!547638 lt!547645) (ite c!118820 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118818 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118820 minValue!944 (ite c!118818 zeroValue!944 minValue!944)) k0!934) lt!547848)))

(declare-fun bs!34136 () Bool)

(assert (= bs!34136 d!133383))

(declare-fun m!1113905 () Bool)

(assert (=> bs!34136 m!1113905))

(assert (=> bs!34136 m!1113905))

(declare-fun m!1113907 () Bool)

(assert (=> bs!34136 m!1113907))

(declare-fun m!1113909 () Bool)

(assert (=> bs!34136 m!1113909))

(declare-fun m!1113911 () Bool)

(assert (=> bs!34136 m!1113911))

(assert (=> bm!58738 d!133383))

(declare-fun d!133385 () Bool)

(declare-fun res!802875 () Bool)

(declare-fun e!686033 () Bool)

(assert (=> d!133385 (=> res!802875 e!686033)))

(assert (=> d!133385 (= res!802875 (= (select (arr!37691 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!133385 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!686033)))

(declare-fun b!1207864 () Bool)

(declare-fun e!686034 () Bool)

(assert (=> b!1207864 (= e!686033 e!686034)))

(declare-fun res!802876 () Bool)

(assert (=> b!1207864 (=> (not res!802876) (not e!686034))))

(assert (=> b!1207864 (= res!802876 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38228 _keys!1208)))))

(declare-fun b!1207865 () Bool)

(assert (=> b!1207865 (= e!686034 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!133385 (not res!802875)) b!1207864))

(assert (= (and b!1207864 res!802876) b!1207865))

(assert (=> d!133385 m!1113697))

(declare-fun m!1113913 () Bool)

(assert (=> b!1207865 m!1113913))

(assert (=> b!1207524 d!133385))

(declare-fun d!133387 () Bool)

(assert (=> d!133387 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!547851 () Unit!39945)

(declare-fun choose!13 (array!78113 (_ BitVec 64) (_ BitVec 32)) Unit!39945)

(assert (=> d!133387 (= lt!547851 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!133387 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!133387 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!547851)))

(declare-fun bs!34137 () Bool)

(assert (= bs!34137 d!133387))

(assert (=> bs!34137 m!1113537))

(declare-fun m!1113915 () Bool)

(assert (=> bs!34137 m!1113915))

(assert (=> b!1207524 d!133387))

(assert (=> b!1207515 d!133343))

(declare-fun d!133389 () Bool)

(declare-fun res!802877 () Bool)

(declare-fun e!686035 () Bool)

(assert (=> d!133389 (=> res!802877 e!686035)))

(assert (=> d!133389 (= res!802877 (bvsge #b00000000000000000000000000000000 (size!38228 lt!547647)))))

(assert (=> d!133389 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!547647 mask!1564) e!686035)))

(declare-fun b!1207866 () Bool)

(declare-fun e!686037 () Bool)

(declare-fun call!58810 () Bool)

(assert (=> b!1207866 (= e!686037 call!58810)))

(declare-fun b!1207867 () Bool)

(declare-fun e!686036 () Bool)

(assert (=> b!1207867 (= e!686036 call!58810)))

(declare-fun bm!58807 () Bool)

(assert (=> bm!58807 (= call!58810 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!547647 mask!1564))))

(declare-fun b!1207868 () Bool)

(assert (=> b!1207868 (= e!686037 e!686036)))

(declare-fun lt!547854 () (_ BitVec 64))

(assert (=> b!1207868 (= lt!547854 (select (arr!37691 lt!547647) #b00000000000000000000000000000000))))

(declare-fun lt!547853 () Unit!39945)

(assert (=> b!1207868 (= lt!547853 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!547647 lt!547854 #b00000000000000000000000000000000))))

(assert (=> b!1207868 (arrayContainsKey!0 lt!547647 lt!547854 #b00000000000000000000000000000000)))

(declare-fun lt!547852 () Unit!39945)

(assert (=> b!1207868 (= lt!547852 lt!547853)))

(declare-fun res!802878 () Bool)

(assert (=> b!1207868 (= res!802878 (= (seekEntryOrOpen!0 (select (arr!37691 lt!547647) #b00000000000000000000000000000000) lt!547647 mask!1564) (Found!9893 #b00000000000000000000000000000000)))))

(assert (=> b!1207868 (=> (not res!802878) (not e!686036))))

(declare-fun b!1207869 () Bool)

(assert (=> b!1207869 (= e!686035 e!686037)))

(declare-fun c!118895 () Bool)

(assert (=> b!1207869 (= c!118895 (validKeyInArray!0 (select (arr!37691 lt!547647) #b00000000000000000000000000000000)))))

(assert (= (and d!133389 (not res!802877)) b!1207869))

(assert (= (and b!1207869 c!118895) b!1207868))

(assert (= (and b!1207869 (not c!118895)) b!1207866))

(assert (= (and b!1207868 res!802878) b!1207867))

(assert (= (or b!1207867 b!1207866) bm!58807))

(declare-fun m!1113917 () Bool)

(assert (=> bm!58807 m!1113917))

(assert (=> b!1207868 m!1113879))

(declare-fun m!1113919 () Bool)

(assert (=> b!1207868 m!1113919))

(declare-fun m!1113921 () Bool)

(assert (=> b!1207868 m!1113921))

(assert (=> b!1207868 m!1113879))

(declare-fun m!1113923 () Bool)

(assert (=> b!1207868 m!1113923))

(assert (=> b!1207869 m!1113879))

(assert (=> b!1207869 m!1113879))

(assert (=> b!1207869 m!1113885))

(assert (=> b!1207523 d!133389))

(declare-fun condMapEmpty!47838 () Bool)

(declare-fun mapDefault!47838 () ValueCell!14615)

(assert (=> mapNonEmpty!47829 (= condMapEmpty!47838 (= mapRest!47829 ((as const (Array (_ BitVec 32) ValueCell!14615)) mapDefault!47838)))))

(declare-fun e!686042 () Bool)

(declare-fun mapRes!47838 () Bool)

(assert (=> mapNonEmpty!47829 (= tp!90838 (and e!686042 mapRes!47838))))

(declare-fun mapNonEmpty!47838 () Bool)

(declare-fun tp!90853 () Bool)

(declare-fun e!686043 () Bool)

(assert (=> mapNonEmpty!47838 (= mapRes!47838 (and tp!90853 e!686043))))

(declare-fun mapRest!47838 () (Array (_ BitVec 32) ValueCell!14615))

(declare-fun mapKey!47838 () (_ BitVec 32))

(declare-fun mapValue!47838 () ValueCell!14615)

(assert (=> mapNonEmpty!47838 (= mapRest!47829 (store mapRest!47838 mapKey!47838 mapValue!47838))))

(declare-fun b!1207876 () Bool)

(assert (=> b!1207876 (= e!686043 tp_is_empty!30649)))

(declare-fun mapIsEmpty!47838 () Bool)

(assert (=> mapIsEmpty!47838 mapRes!47838))

(declare-fun b!1207877 () Bool)

(assert (=> b!1207877 (= e!686042 tp_is_empty!30649)))

(assert (= (and mapNonEmpty!47829 condMapEmpty!47838) mapIsEmpty!47838))

(assert (= (and mapNonEmpty!47829 (not condMapEmpty!47838)) mapNonEmpty!47838))

(assert (= (and mapNonEmpty!47838 ((_ is ValueCellFull!14615) mapValue!47838)) b!1207876))

(assert (= (and mapNonEmpty!47829 ((_ is ValueCellFull!14615) mapDefault!47838)) b!1207877))

(declare-fun m!1113925 () Bool)

(assert (=> mapNonEmpty!47838 m!1113925))

(declare-fun b_lambda!21369 () Bool)

(assert (= b_lambda!21355 (or (and start!101010 b_free!25945) b_lambda!21369)))

(declare-fun b_lambda!21371 () Bool)

(assert (= b_lambda!21353 (or (and start!101010 b_free!25945) b_lambda!21371)))

(declare-fun b_lambda!21373 () Bool)

(assert (= b_lambda!21361 (or (and start!101010 b_free!25945) b_lambda!21373)))

(declare-fun b_lambda!21375 () Bool)

(assert (= b_lambda!21359 (or (and start!101010 b_free!25945) b_lambda!21375)))

(declare-fun b_lambda!21377 () Bool)

(assert (= b_lambda!21357 (or (and start!101010 b_free!25945) b_lambda!21377)))

(declare-fun b_lambda!21379 () Bool)

(assert (= b_lambda!21363 (or (and start!101010 b_free!25945) b_lambda!21379)))

(declare-fun b_lambda!21381 () Bool)

(assert (= b_lambda!21365 (or (and start!101010 b_free!25945) b_lambda!21381)))

(declare-fun b_lambda!21383 () Bool)

(assert (= b_lambda!21367 (or (and start!101010 b_free!25945) b_lambda!21383)))

(declare-fun b_lambda!21385 () Bool)

(assert (= b_lambda!21351 (or (and start!101010 b_free!25945) b_lambda!21385)))

(check-sat (not b!1207840) (not b!1207830) (not b!1207786) (not b_lambda!21379) (not b!1207835) (not bm!58799) (not d!133375) (not d!133383) (not b!1207751) (not b!1207756) (not b_next!25945) (not b!1207859) (not b!1207838) (not b!1207816) (not bm!58807) (not b!1207800) (not b!1207862) (not d!133387) (not b!1207846) (not d!133345) (not b!1207823) (not b_lambda!21375) (not b!1207847) (not b!1207868) (not b_lambda!21371) (not d!133349) (not b!1207849) (not b_lambda!21385) (not bm!58795) (not d!133339) (not b!1207752) (not b!1207809) (not b_lambda!21349) (not b!1207865) (not b_lambda!21381) (not b!1207790) (not b!1207720) (not d!133369) (not b!1207820) (not b!1207772) (not bm!58806) (not b!1207817) (not b_lambda!21383) (not d!133379) (not bm!58789) (not bm!58796) (not b!1207782) (not d!133355) (not bm!58797) (not b!1207818) (not b!1207851) (not b!1207760) (not b!1207759) (not bm!58805) (not b!1207848) (not b_lambda!21373) b_and!42907 (not bm!58798) (not b!1207842) (not d!133353) (not b!1207843) (not b!1207826) (not b!1207778) (not d!133359) (not b!1207827) (not d!133361) (not b!1207829) (not bm!58792) (not b!1207771) (not d!133371) (not b!1207721) (not b!1207834) (not d!133357) (not b_lambda!21377) (not b!1207792) (not b!1207841) (not b!1207831) (not b!1207783) (not b!1207785) (not b_lambda!21369) (not b!1207821) (not b!1207789) (not b!1207811) (not b!1207839) (not d!133363) (not b!1207863) (not b!1207784) (not b!1207781) (not b!1207755) (not b!1207794) (not b!1207723) (not d!133351) (not b!1207791) (not b!1207754) (not bm!58800) (not b!1207828) (not b!1207753) tp_is_empty!30649 (not mapNonEmpty!47838) (not b!1207869))
(check-sat b_and!42907 (not b_next!25945))
