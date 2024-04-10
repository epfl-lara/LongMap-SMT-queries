; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101472 () Bool)

(assert start!101472)

(declare-fun b_free!26289 () Bool)

(declare-fun b_next!26289 () Bool)

(assert (=> start!101472 (= b_free!26289 (not b_next!26289))))

(declare-fun tp!91900 () Bool)

(declare-fun b_and!43767 () Bool)

(assert (=> start!101472 (= tp!91900 b_and!43767)))

(declare-fun b!1219723 () Bool)

(declare-fun e!692563 () Bool)

(declare-fun e!692572 () Bool)

(assert (=> b!1219723 (= e!692563 (not e!692572))))

(declare-fun res!810166 () Bool)

(assert (=> b!1219723 (=> res!810166 e!692572)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1219723 (= res!810166 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!78763 0))(
  ( (array!78764 (arr!38012 (Array (_ BitVec 32) (_ BitVec 64))) (size!38548 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78763)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78763 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1219723 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40418 0))(
  ( (Unit!40419) )
))
(declare-fun lt!554589 () Unit!40418)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78763 (_ BitVec 64) (_ BitVec 32)) Unit!40418)

(assert (=> b!1219723 (= lt!554589 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1219724 () Bool)

(declare-fun e!692566 () Bool)

(declare-fun e!692571 () Bool)

(assert (=> b!1219724 (= e!692566 e!692571)))

(declare-fun res!810161 () Bool)

(assert (=> b!1219724 (=> res!810161 e!692571)))

(assert (=> b!1219724 (= res!810161 (not (= (select (arr!38012 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1219725 () Bool)

(declare-fun e!692567 () Bool)

(assert (=> b!1219725 (= e!692567 e!692563)))

(declare-fun res!810159 () Bool)

(assert (=> b!1219725 (=> (not res!810159) (not e!692563))))

(declare-fun lt!554592 () array!78763)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78763 (_ BitVec 32)) Bool)

(assert (=> b!1219725 (= res!810159 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!554592 mask!1564))))

(assert (=> b!1219725 (= lt!554592 (array!78764 (store (arr!38012 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38548 _keys!1208)))))

(declare-fun b!1219726 () Bool)

(declare-fun e!692570 () Bool)

(declare-fun e!692568 () Bool)

(assert (=> b!1219726 (= e!692570 e!692568)))

(declare-fun res!810156 () Bool)

(assert (=> b!1219726 (=> res!810156 e!692568)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1219726 (= res!810156 (not (validKeyInArray!0 (select (arr!38012 _keys!1208) from!1455))))))

(declare-datatypes ((V!46451 0))(
  ( (V!46452 (val!15553 Int)) )
))
(declare-datatypes ((tuple2!20018 0))(
  ( (tuple2!20019 (_1!10020 (_ BitVec 64)) (_2!10020 V!46451)) )
))
(declare-datatypes ((List!26817 0))(
  ( (Nil!26814) (Cons!26813 (h!28022 tuple2!20018) (t!40086 List!26817)) )
))
(declare-datatypes ((ListLongMap!17987 0))(
  ( (ListLongMap!17988 (toList!9009 List!26817)) )
))
(declare-fun lt!554588 () ListLongMap!17987)

(declare-fun lt!554593 () ListLongMap!17987)

(assert (=> b!1219726 (= lt!554588 lt!554593)))

(declare-fun lt!554590 () ListLongMap!17987)

(declare-fun -!1920 (ListLongMap!17987 (_ BitVec 64)) ListLongMap!17987)

(assert (=> b!1219726 (= lt!554593 (-!1920 lt!554590 k0!934))))

(declare-fun zeroValue!944 () V!46451)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14787 0))(
  ( (ValueCellFull!14787 (v!18210 V!46451)) (EmptyCell!14787) )
))
(declare-datatypes ((array!78765 0))(
  ( (array!78766 (arr!38013 (Array (_ BitVec 32) ValueCell!14787)) (size!38549 (_ BitVec 32))) )
))
(declare-fun lt!554597 () array!78765)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46451)

(declare-fun getCurrentListMapNoExtraKeys!5433 (array!78763 array!78765 (_ BitVec 32) (_ BitVec 32) V!46451 V!46451 (_ BitVec 32) Int) ListLongMap!17987)

(assert (=> b!1219726 (= lt!554588 (getCurrentListMapNoExtraKeys!5433 lt!554592 lt!554597 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!78765)

(assert (=> b!1219726 (= lt!554590 (getCurrentListMapNoExtraKeys!5433 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!554594 () Unit!40418)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1127 (array!78763 array!78765 (_ BitVec 32) (_ BitVec 32) V!46451 V!46451 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40418)

(assert (=> b!1219726 (= lt!554594 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1127 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1219727 () Bool)

(declare-fun res!810154 () Bool)

(assert (=> b!1219727 (=> (not res!810154) (not e!692567))))

(assert (=> b!1219727 (= res!810154 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38548 _keys!1208))))))

(declare-fun res!810160 () Bool)

(assert (=> start!101472 (=> (not res!810160) (not e!692567))))

(assert (=> start!101472 (= res!810160 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38548 _keys!1208))))))

(assert (=> start!101472 e!692567))

(declare-fun tp_is_empty!30993 () Bool)

(assert (=> start!101472 tp_is_empty!30993))

(declare-fun array_inv!28926 (array!78763) Bool)

(assert (=> start!101472 (array_inv!28926 _keys!1208)))

(assert (=> start!101472 true))

(assert (=> start!101472 tp!91900))

(declare-fun e!692569 () Bool)

(declare-fun array_inv!28927 (array!78765) Bool)

(assert (=> start!101472 (and (array_inv!28927 _values!996) e!692569)))

(declare-fun b!1219728 () Bool)

(declare-fun res!810155 () Bool)

(assert (=> b!1219728 (=> (not res!810155) (not e!692567))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1219728 (= res!810155 (validMask!0 mask!1564))))

(declare-fun b!1219729 () Bool)

(declare-fun e!692564 () Bool)

(assert (=> b!1219729 (= e!692568 e!692564)))

(declare-fun res!810163 () Bool)

(assert (=> b!1219729 (=> res!810163 e!692564)))

(assert (=> b!1219729 (= res!810163 (not (= (select (arr!38012 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1219729 e!692566))

(declare-fun res!810153 () Bool)

(assert (=> b!1219729 (=> (not res!810153) (not e!692566))))

(declare-fun lt!554598 () ListLongMap!17987)

(declare-fun lt!554596 () V!46451)

(declare-fun +!4077 (ListLongMap!17987 tuple2!20018) ListLongMap!17987)

(declare-fun get!19388 (ValueCell!14787 V!46451) V!46451)

(assert (=> b!1219729 (= res!810153 (= lt!554598 (+!4077 lt!554593 (tuple2!20019 (select (arr!38012 _keys!1208) from!1455) (get!19388 (select (arr!38013 _values!996) from!1455) lt!554596)))))))

(declare-fun mapNonEmpty!48376 () Bool)

(declare-fun mapRes!48376 () Bool)

(declare-fun tp!91901 () Bool)

(declare-fun e!692565 () Bool)

(assert (=> mapNonEmpty!48376 (= mapRes!48376 (and tp!91901 e!692565))))

(declare-fun mapValue!48376 () ValueCell!14787)

(declare-fun mapKey!48376 () (_ BitVec 32))

(declare-fun mapRest!48376 () (Array (_ BitVec 32) ValueCell!14787))

(assert (=> mapNonEmpty!48376 (= (arr!38013 _values!996) (store mapRest!48376 mapKey!48376 mapValue!48376))))

(declare-fun b!1219730 () Bool)

(declare-fun res!810168 () Bool)

(assert (=> b!1219730 (=> (not res!810168) (not e!692567))))

(assert (=> b!1219730 (= res!810168 (and (= (size!38549 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38548 _keys!1208) (size!38549 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1219731 () Bool)

(declare-fun res!810162 () Bool)

(assert (=> b!1219731 (=> (not res!810162) (not e!692567))))

(assert (=> b!1219731 (= res!810162 (validKeyInArray!0 k0!934))))

(declare-fun b!1219732 () Bool)

(assert (=> b!1219732 (= e!692572 e!692570)))

(declare-fun res!810157 () Bool)

(assert (=> b!1219732 (=> res!810157 e!692570)))

(assert (=> b!1219732 (= res!810157 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1219732 (= lt!554598 (getCurrentListMapNoExtraKeys!5433 lt!554592 lt!554597 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1219732 (= lt!554597 (array!78766 (store (arr!38013 _values!996) i!673 (ValueCellFull!14787 lt!554596)) (size!38549 _values!996)))))

(declare-fun dynLambda!3315 (Int (_ BitVec 64)) V!46451)

(assert (=> b!1219732 (= lt!554596 (dynLambda!3315 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!554591 () ListLongMap!17987)

(assert (=> b!1219732 (= lt!554591 (getCurrentListMapNoExtraKeys!5433 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1219733 () Bool)

(assert (=> b!1219733 (= e!692571 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!48376 () Bool)

(assert (=> mapIsEmpty!48376 mapRes!48376))

(declare-fun b!1219734 () Bool)

(declare-fun res!810165 () Bool)

(assert (=> b!1219734 (=> (not res!810165) (not e!692567))))

(assert (=> b!1219734 (= res!810165 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1219735 () Bool)

(declare-fun res!810164 () Bool)

(assert (=> b!1219735 (=> (not res!810164) (not e!692563))))

(declare-datatypes ((List!26818 0))(
  ( (Nil!26815) (Cons!26814 (h!28023 (_ BitVec 64)) (t!40087 List!26818)) )
))
(declare-fun arrayNoDuplicates!0 (array!78763 (_ BitVec 32) List!26818) Bool)

(assert (=> b!1219735 (= res!810164 (arrayNoDuplicates!0 lt!554592 #b00000000000000000000000000000000 Nil!26815))))

(declare-fun b!1219736 () Bool)

(assert (=> b!1219736 (= e!692564 true)))

(assert (=> b!1219736 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!554595 () Unit!40418)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78763 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40418)

(assert (=> b!1219736 (= lt!554595 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1219737 () Bool)

(declare-fun e!692562 () Bool)

(assert (=> b!1219737 (= e!692569 (and e!692562 mapRes!48376))))

(declare-fun condMapEmpty!48376 () Bool)

(declare-fun mapDefault!48376 () ValueCell!14787)

(assert (=> b!1219737 (= condMapEmpty!48376 (= (arr!38013 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14787)) mapDefault!48376)))))

(declare-fun b!1219738 () Bool)

(assert (=> b!1219738 (= e!692562 tp_is_empty!30993)))

(declare-fun b!1219739 () Bool)

(declare-fun res!810167 () Bool)

(assert (=> b!1219739 (=> (not res!810167) (not e!692567))))

(assert (=> b!1219739 (= res!810167 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26815))))

(declare-fun b!1219740 () Bool)

(assert (=> b!1219740 (= e!692565 tp_is_empty!30993)))

(declare-fun b!1219741 () Bool)

(declare-fun res!810158 () Bool)

(assert (=> b!1219741 (=> (not res!810158) (not e!692567))))

(assert (=> b!1219741 (= res!810158 (= (select (arr!38012 _keys!1208) i!673) k0!934))))

(assert (= (and start!101472 res!810160) b!1219728))

(assert (= (and b!1219728 res!810155) b!1219730))

(assert (= (and b!1219730 res!810168) b!1219734))

(assert (= (and b!1219734 res!810165) b!1219739))

(assert (= (and b!1219739 res!810167) b!1219727))

(assert (= (and b!1219727 res!810154) b!1219731))

(assert (= (and b!1219731 res!810162) b!1219741))

(assert (= (and b!1219741 res!810158) b!1219725))

(assert (= (and b!1219725 res!810159) b!1219735))

(assert (= (and b!1219735 res!810164) b!1219723))

(assert (= (and b!1219723 (not res!810166)) b!1219732))

(assert (= (and b!1219732 (not res!810157)) b!1219726))

(assert (= (and b!1219726 (not res!810156)) b!1219729))

(assert (= (and b!1219729 res!810153) b!1219724))

(assert (= (and b!1219724 (not res!810161)) b!1219733))

(assert (= (and b!1219729 (not res!810163)) b!1219736))

(assert (= (and b!1219737 condMapEmpty!48376) mapIsEmpty!48376))

(assert (= (and b!1219737 (not condMapEmpty!48376)) mapNonEmpty!48376))

(get-info :version)

(assert (= (and mapNonEmpty!48376 ((_ is ValueCellFull!14787) mapValue!48376)) b!1219740))

(assert (= (and b!1219737 ((_ is ValueCellFull!14787) mapDefault!48376)) b!1219738))

(assert (= start!101472 b!1219737))

(declare-fun b_lambda!22117 () Bool)

(assert (=> (not b_lambda!22117) (not b!1219732)))

(declare-fun t!40085 () Bool)

(declare-fun tb!11089 () Bool)

(assert (=> (and start!101472 (= defaultEntry!1004 defaultEntry!1004) t!40085) tb!11089))

(declare-fun result!22783 () Bool)

(assert (=> tb!11089 (= result!22783 tp_is_empty!30993)))

(assert (=> b!1219732 t!40085))

(declare-fun b_and!43769 () Bool)

(assert (= b_and!43767 (and (=> t!40085 result!22783) b_and!43769)))

(declare-fun m!1124499 () Bool)

(assert (=> b!1219731 m!1124499))

(declare-fun m!1124501 () Bool)

(assert (=> b!1219729 m!1124501))

(declare-fun m!1124503 () Bool)

(assert (=> b!1219729 m!1124503))

(assert (=> b!1219729 m!1124503))

(declare-fun m!1124505 () Bool)

(assert (=> b!1219729 m!1124505))

(declare-fun m!1124507 () Bool)

(assert (=> b!1219729 m!1124507))

(declare-fun m!1124509 () Bool)

(assert (=> b!1219741 m!1124509))

(assert (=> b!1219724 m!1124501))

(declare-fun m!1124511 () Bool)

(assert (=> b!1219735 m!1124511))

(declare-fun m!1124513 () Bool)

(assert (=> start!101472 m!1124513))

(declare-fun m!1124515 () Bool)

(assert (=> start!101472 m!1124515))

(declare-fun m!1124517 () Bool)

(assert (=> b!1219736 m!1124517))

(declare-fun m!1124519 () Bool)

(assert (=> b!1219736 m!1124519))

(declare-fun m!1124521 () Bool)

(assert (=> b!1219739 m!1124521))

(declare-fun m!1124523 () Bool)

(assert (=> mapNonEmpty!48376 m!1124523))

(declare-fun m!1124525 () Bool)

(assert (=> b!1219726 m!1124525))

(declare-fun m!1124527 () Bool)

(assert (=> b!1219726 m!1124527))

(assert (=> b!1219726 m!1124501))

(declare-fun m!1124529 () Bool)

(assert (=> b!1219726 m!1124529))

(declare-fun m!1124531 () Bool)

(assert (=> b!1219726 m!1124531))

(declare-fun m!1124533 () Bool)

(assert (=> b!1219726 m!1124533))

(assert (=> b!1219726 m!1124501))

(declare-fun m!1124535 () Bool)

(assert (=> b!1219734 m!1124535))

(declare-fun m!1124537 () Bool)

(assert (=> b!1219732 m!1124537))

(declare-fun m!1124539 () Bool)

(assert (=> b!1219732 m!1124539))

(declare-fun m!1124541 () Bool)

(assert (=> b!1219732 m!1124541))

(declare-fun m!1124543 () Bool)

(assert (=> b!1219732 m!1124543))

(declare-fun m!1124545 () Bool)

(assert (=> b!1219723 m!1124545))

(declare-fun m!1124547 () Bool)

(assert (=> b!1219723 m!1124547))

(declare-fun m!1124549 () Bool)

(assert (=> b!1219725 m!1124549))

(declare-fun m!1124551 () Bool)

(assert (=> b!1219725 m!1124551))

(declare-fun m!1124553 () Bool)

(assert (=> b!1219733 m!1124553))

(declare-fun m!1124555 () Bool)

(assert (=> b!1219728 m!1124555))

(check-sat (not b!1219723) (not b!1219739) tp_is_empty!30993 (not b!1219733) (not start!101472) (not b_lambda!22117) (not b!1219729) (not b!1219735) (not b!1219734) (not b!1219736) (not b!1219726) (not b!1219732) b_and!43769 (not b_next!26289) (not b!1219725) (not b!1219728) (not b!1219731) (not mapNonEmpty!48376))
(check-sat b_and!43769 (not b_next!26289))
