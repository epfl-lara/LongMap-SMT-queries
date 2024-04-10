; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98128 () Bool)

(assert start!98128)

(declare-fun b_free!23829 () Bool)

(declare-fun b_next!23829 () Bool)

(assert (=> start!98128 (= b_free!23829 (not b_next!23829))))

(declare-fun tp!84190 () Bool)

(declare-fun b_and!38441 () Bool)

(assert (=> start!98128 (= tp!84190 b_and!38441)))

(declare-fun b!1127811 () Bool)

(declare-fun e!641902 () Bool)

(declare-fun e!641904 () Bool)

(declare-fun mapRes!44356 () Bool)

(assert (=> b!1127811 (= e!641902 (and e!641904 mapRes!44356))))

(declare-fun condMapEmpty!44356 () Bool)

(declare-datatypes ((V!42939 0))(
  ( (V!42940 (val!14236 Int)) )
))
(declare-datatypes ((ValueCell!13470 0))(
  ( (ValueCellFull!13470 (v!16869 V!42939)) (EmptyCell!13470) )
))
(declare-datatypes ((array!73577 0))(
  ( (array!73578 (arr!35441 (Array (_ BitVec 32) ValueCell!13470)) (size!35977 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73577)

(declare-fun mapDefault!44356 () ValueCell!13470)

(assert (=> b!1127811 (= condMapEmpty!44356 (= (arr!35441 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13470)) mapDefault!44356)))))

(declare-fun res!753683 () Bool)

(declare-fun e!641901 () Bool)

(assert (=> start!98128 (=> (not res!753683) (not e!641901))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!73579 0))(
  ( (array!73580 (arr!35442 (Array (_ BitVec 32) (_ BitVec 64))) (size!35978 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73579)

(assert (=> start!98128 (= res!753683 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35978 _keys!1208))))))

(assert (=> start!98128 e!641901))

(declare-fun tp_is_empty!28359 () Bool)

(assert (=> start!98128 tp_is_empty!28359))

(declare-fun array_inv!27194 (array!73579) Bool)

(assert (=> start!98128 (array_inv!27194 _keys!1208)))

(assert (=> start!98128 true))

(assert (=> start!98128 tp!84190))

(declare-fun array_inv!27195 (array!73577) Bool)

(assert (=> start!98128 (and (array_inv!27195 _values!996) e!641902)))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!17908 0))(
  ( (tuple2!17909 (_1!8965 (_ BitVec 64)) (_2!8965 V!42939)) )
))
(declare-datatypes ((List!24680 0))(
  ( (Nil!24677) (Cons!24676 (h!25885 tuple2!17908) (t!35501 List!24680)) )
))
(declare-datatypes ((ListLongMap!15877 0))(
  ( (ListLongMap!15878 (toList!7954 List!24680)) )
))
(declare-fun call!47769 () ListLongMap!15877)

(declare-fun minValue!944 () V!42939)

(declare-fun zeroValue!944 () V!42939)

(declare-fun bm!47766 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4442 (array!73579 array!73577 (_ BitVec 32) (_ BitVec 32) V!42939 V!42939 (_ BitVec 32) Int) ListLongMap!15877)

(assert (=> bm!47766 (= call!47769 (getCurrentListMapNoExtraKeys!4442 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!641899 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun call!47770 () ListLongMap!15877)

(declare-fun b!1127812 () Bool)

(declare-fun -!1142 (ListLongMap!15877 (_ BitVec 64)) ListLongMap!15877)

(assert (=> b!1127812 (= e!641899 (= call!47770 (-!1142 call!47769 k0!934)))))

(declare-fun b!1127813 () Bool)

(declare-fun res!753685 () Bool)

(assert (=> b!1127813 (=> (not res!753685) (not e!641901))))

(assert (=> b!1127813 (= res!753685 (and (= (size!35977 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35978 _keys!1208) (size!35977 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1127814 () Bool)

(declare-fun res!753676 () Bool)

(assert (=> b!1127814 (=> (not res!753676) (not e!641901))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1127814 (= res!753676 (validMask!0 mask!1564))))

(declare-fun b!1127815 () Bool)

(assert (=> b!1127815 (= e!641904 tp_is_empty!28359)))

(declare-fun b!1127816 () Bool)

(declare-fun e!641898 () Bool)

(declare-fun e!641906 () Bool)

(assert (=> b!1127816 (= e!641898 (not e!641906))))

(declare-fun res!753687 () Bool)

(assert (=> b!1127816 (=> res!753687 e!641906)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1127816 (= res!753687 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73579 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1127816 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36952 0))(
  ( (Unit!36953) )
))
(declare-fun lt!500726 () Unit!36952)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73579 (_ BitVec 64) (_ BitVec 32)) Unit!36952)

(assert (=> b!1127816 (= lt!500726 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1127817 () Bool)

(assert (=> b!1127817 (= e!641901 e!641898)))

(declare-fun res!753678 () Bool)

(assert (=> b!1127817 (=> (not res!753678) (not e!641898))))

(declare-fun lt!500731 () array!73579)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73579 (_ BitVec 32)) Bool)

(assert (=> b!1127817 (= res!753678 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!500731 mask!1564))))

(assert (=> b!1127817 (= lt!500731 (array!73580 (store (arr!35442 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35978 _keys!1208)))))

(declare-fun mapNonEmpty!44356 () Bool)

(declare-fun tp!84191 () Bool)

(declare-fun e!641907 () Bool)

(assert (=> mapNonEmpty!44356 (= mapRes!44356 (and tp!84191 e!641907))))

(declare-fun mapKey!44356 () (_ BitVec 32))

(declare-fun mapRest!44356 () (Array (_ BitVec 32) ValueCell!13470))

(declare-fun mapValue!44356 () ValueCell!13470)

(assert (=> mapNonEmpty!44356 (= (arr!35441 _values!996) (store mapRest!44356 mapKey!44356 mapValue!44356))))

(declare-fun lt!500732 () array!73577)

(declare-fun bm!47767 () Bool)

(assert (=> bm!47767 (= call!47770 (getCurrentListMapNoExtraKeys!4442 lt!500731 lt!500732 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1127818 () Bool)

(declare-fun e!641900 () Bool)

(assert (=> b!1127818 (= e!641906 e!641900)))

(declare-fun res!753686 () Bool)

(assert (=> b!1127818 (=> res!753686 e!641900)))

(assert (=> b!1127818 (= res!753686 (not (= from!1455 i!673)))))

(declare-fun lt!500728 () ListLongMap!15877)

(assert (=> b!1127818 (= lt!500728 (getCurrentListMapNoExtraKeys!4442 lt!500731 lt!500732 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2527 (Int (_ BitVec 64)) V!42939)

(assert (=> b!1127818 (= lt!500732 (array!73578 (store (arr!35441 _values!996) i!673 (ValueCellFull!13470 (dynLambda!2527 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35977 _values!996)))))

(declare-fun lt!500727 () ListLongMap!15877)

(assert (=> b!1127818 (= lt!500727 (getCurrentListMapNoExtraKeys!4442 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1127819 () Bool)

(declare-fun res!753677 () Bool)

(assert (=> b!1127819 (=> (not res!753677) (not e!641898))))

(declare-datatypes ((List!24681 0))(
  ( (Nil!24678) (Cons!24677 (h!25886 (_ BitVec 64)) (t!35502 List!24681)) )
))
(declare-fun arrayNoDuplicates!0 (array!73579 (_ BitVec 32) List!24681) Bool)

(assert (=> b!1127819 (= res!753677 (arrayNoDuplicates!0 lt!500731 #b00000000000000000000000000000000 Nil!24678))))

(declare-fun b!1127820 () Bool)

(declare-fun res!753679 () Bool)

(assert (=> b!1127820 (=> (not res!753679) (not e!641901))))

(assert (=> b!1127820 (= res!753679 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35978 _keys!1208))))))

(declare-fun b!1127821 () Bool)

(assert (=> b!1127821 (= e!641907 tp_is_empty!28359)))

(declare-fun b!1127822 () Bool)

(declare-fun res!753681 () Bool)

(assert (=> b!1127822 (=> (not res!753681) (not e!641901))))

(assert (=> b!1127822 (= res!753681 (= (select (arr!35442 _keys!1208) i!673) k0!934))))

(declare-fun b!1127823 () Bool)

(declare-fun res!753682 () Bool)

(assert (=> b!1127823 (=> (not res!753682) (not e!641901))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1127823 (= res!753682 (validKeyInArray!0 k0!934))))

(declare-fun b!1127824 () Bool)

(declare-fun res!753684 () Bool)

(assert (=> b!1127824 (=> (not res!753684) (not e!641901))))

(assert (=> b!1127824 (= res!753684 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1127825 () Bool)

(assert (=> b!1127825 (= e!641899 (= call!47770 call!47769))))

(declare-fun b!1127826 () Bool)

(declare-fun e!641903 () Bool)

(assert (=> b!1127826 (= e!641900 e!641903)))

(declare-fun res!753688 () Bool)

(assert (=> b!1127826 (=> res!753688 e!641903)))

(assert (=> b!1127826 (= res!753688 (not (= (select (arr!35442 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1127826 e!641899))

(declare-fun c!109734 () Bool)

(assert (=> b!1127826 (= c!109734 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!500729 () Unit!36952)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!396 (array!73579 array!73577 (_ BitVec 32) (_ BitVec 32) V!42939 V!42939 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36952)

(assert (=> b!1127826 (= lt!500729 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!396 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!44356 () Bool)

(assert (=> mapIsEmpty!44356 mapRes!44356))

(declare-fun b!1127827 () Bool)

(declare-fun res!753680 () Bool)

(assert (=> b!1127827 (=> (not res!753680) (not e!641901))))

(assert (=> b!1127827 (= res!753680 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24678))))

(declare-fun b!1127828 () Bool)

(assert (=> b!1127828 (= e!641903 true)))

(declare-fun lt!500730 () Bool)

(declare-fun contains!6483 (ListLongMap!15877 (_ BitVec 64)) Bool)

(assert (=> b!1127828 (= lt!500730 (contains!6483 (getCurrentListMapNoExtraKeys!4442 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(assert (= (and start!98128 res!753683) b!1127814))

(assert (= (and b!1127814 res!753676) b!1127813))

(assert (= (and b!1127813 res!753685) b!1127824))

(assert (= (and b!1127824 res!753684) b!1127827))

(assert (= (and b!1127827 res!753680) b!1127820))

(assert (= (and b!1127820 res!753679) b!1127823))

(assert (= (and b!1127823 res!753682) b!1127822))

(assert (= (and b!1127822 res!753681) b!1127817))

(assert (= (and b!1127817 res!753678) b!1127819))

(assert (= (and b!1127819 res!753677) b!1127816))

(assert (= (and b!1127816 (not res!753687)) b!1127818))

(assert (= (and b!1127818 (not res!753686)) b!1127826))

(assert (= (and b!1127826 c!109734) b!1127812))

(assert (= (and b!1127826 (not c!109734)) b!1127825))

(assert (= (or b!1127812 b!1127825) bm!47767))

(assert (= (or b!1127812 b!1127825) bm!47766))

(assert (= (and b!1127826 (not res!753688)) b!1127828))

(assert (= (and b!1127811 condMapEmpty!44356) mapIsEmpty!44356))

(assert (= (and b!1127811 (not condMapEmpty!44356)) mapNonEmpty!44356))

(get-info :version)

(assert (= (and mapNonEmpty!44356 ((_ is ValueCellFull!13470) mapValue!44356)) b!1127821))

(assert (= (and b!1127811 ((_ is ValueCellFull!13470) mapDefault!44356)) b!1127815))

(assert (= start!98128 b!1127811))

(declare-fun b_lambda!18799 () Bool)

(assert (=> (not b_lambda!18799) (not b!1127818)))

(declare-fun t!35500 () Bool)

(declare-fun tb!8641 () Bool)

(assert (=> (and start!98128 (= defaultEntry!1004 defaultEntry!1004) t!35500) tb!8641))

(declare-fun result!17843 () Bool)

(assert (=> tb!8641 (= result!17843 tp_is_empty!28359)))

(assert (=> b!1127818 t!35500))

(declare-fun b_and!38443 () Bool)

(assert (= b_and!38441 (and (=> t!35500 result!17843) b_and!38443)))

(declare-fun m!1041523 () Bool)

(assert (=> b!1127827 m!1041523))

(declare-fun m!1041525 () Bool)

(assert (=> b!1127824 m!1041525))

(declare-fun m!1041527 () Bool)

(assert (=> bm!47766 m!1041527))

(declare-fun m!1041529 () Bool)

(assert (=> b!1127822 m!1041529))

(declare-fun m!1041531 () Bool)

(assert (=> b!1127817 m!1041531))

(declare-fun m!1041533 () Bool)

(assert (=> b!1127817 m!1041533))

(declare-fun m!1041535 () Bool)

(assert (=> b!1127823 m!1041535))

(declare-fun m!1041537 () Bool)

(assert (=> b!1127812 m!1041537))

(declare-fun m!1041539 () Bool)

(assert (=> mapNonEmpty!44356 m!1041539))

(declare-fun m!1041541 () Bool)

(assert (=> start!98128 m!1041541))

(declare-fun m!1041543 () Bool)

(assert (=> start!98128 m!1041543))

(declare-fun m!1041545 () Bool)

(assert (=> bm!47767 m!1041545))

(declare-fun m!1041547 () Bool)

(assert (=> b!1127816 m!1041547))

(declare-fun m!1041549 () Bool)

(assert (=> b!1127816 m!1041549))

(declare-fun m!1041551 () Bool)

(assert (=> b!1127819 m!1041551))

(declare-fun m!1041553 () Bool)

(assert (=> b!1127818 m!1041553))

(declare-fun m!1041555 () Bool)

(assert (=> b!1127818 m!1041555))

(declare-fun m!1041557 () Bool)

(assert (=> b!1127818 m!1041557))

(declare-fun m!1041559 () Bool)

(assert (=> b!1127818 m!1041559))

(declare-fun m!1041561 () Bool)

(assert (=> b!1127814 m!1041561))

(declare-fun m!1041563 () Bool)

(assert (=> b!1127826 m!1041563))

(declare-fun m!1041565 () Bool)

(assert (=> b!1127826 m!1041565))

(assert (=> b!1127828 m!1041527))

(assert (=> b!1127828 m!1041527))

(declare-fun m!1041567 () Bool)

(assert (=> b!1127828 m!1041567))

(check-sat (not start!98128) (not b!1127819) (not bm!47766) (not b_lambda!18799) (not b!1127824) b_and!38443 (not b!1127817) (not b!1127814) (not bm!47767) (not b!1127828) (not b!1127823) (not b_next!23829) (not b!1127826) tp_is_empty!28359 (not b!1127818) (not b!1127827) (not mapNonEmpty!44356) (not b!1127816) (not b!1127812))
(check-sat b_and!38443 (not b_next!23829))
