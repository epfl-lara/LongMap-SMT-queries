; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97988 () Bool)

(assert start!97988)

(declare-fun b_free!23695 () Bool)

(declare-fun b_next!23695 () Bool)

(assert (=> start!97988 (= b_free!23695 (not b_next!23695))))

(declare-fun tp!83789 () Bool)

(declare-fun b_and!38151 () Bool)

(assert (=> start!97988 (= tp!83789 b_and!38151)))

(declare-fun b!1123763 () Bool)

(declare-fun e!639730 () Bool)

(declare-fun tp_is_empty!28225 () Bool)

(assert (=> b!1123763 (= e!639730 tp_is_empty!28225)))

(declare-fun b!1123764 () Bool)

(declare-fun res!750833 () Bool)

(declare-fun e!639733 () Bool)

(assert (=> b!1123764 (=> res!750833 e!639733)))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1123764 (= res!750833 (or (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1123765 () Bool)

(declare-fun e!639737 () Bool)

(declare-fun e!639732 () Bool)

(assert (=> b!1123765 (= e!639737 e!639732)))

(declare-fun res!750831 () Bool)

(assert (=> b!1123765 (=> res!750831 e!639732)))

(declare-datatypes ((array!73240 0))(
  ( (array!73241 (arr!35273 (Array (_ BitVec 32) (_ BitVec 64))) (size!35811 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73240)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1123765 (= res!750831 (not (= (select (arr!35273 _keys!1208) from!1455) k0!934)))))

(declare-fun e!639738 () Bool)

(assert (=> b!1123765 e!639738))

(declare-fun c!109506 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1123765 (= c!109506 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!42761 0))(
  ( (V!42762 (val!14169 Int)) )
))
(declare-fun zeroValue!944 () V!42761)

(declare-datatypes ((Unit!36691 0))(
  ( (Unit!36692) )
))
(declare-fun lt!499056 () Unit!36691)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13403 0))(
  ( (ValueCellFull!13403 (v!16801 V!42761)) (EmptyCell!13403) )
))
(declare-datatypes ((array!73242 0))(
  ( (array!73243 (arr!35274 (Array (_ BitVec 32) ValueCell!13403)) (size!35812 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73242)

(declare-fun minValue!944 () V!42761)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!356 (array!73240 array!73242 (_ BitVec 32) (_ BitVec 32) V!42761 V!42761 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36691)

(assert (=> b!1123765 (= lt!499056 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!356 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1123766 () Bool)

(assert (=> b!1123766 (= e!639733 true)))

(declare-datatypes ((tuple2!17878 0))(
  ( (tuple2!17879 (_1!8950 (_ BitVec 64)) (_2!8950 V!42761)) )
))
(declare-datatypes ((List!24640 0))(
  ( (Nil!24637) (Cons!24636 (h!25845 tuple2!17878) (t!35318 List!24640)) )
))
(declare-datatypes ((ListLongMap!15847 0))(
  ( (ListLongMap!15848 (toList!7939 List!24640)) )
))
(declare-fun lt!499055 () ListLongMap!15847)

(declare-fun contains!6411 (ListLongMap!15847 (_ BitVec 64)) Bool)

(declare-fun +!3445 (ListLongMap!15847 tuple2!17878) ListLongMap!15847)

(assert (=> b!1123766 (contains!6411 (+!3445 lt!499055 (tuple2!17879 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934)))

(declare-fun lt!499054 () Unit!36691)

(declare-fun addStillContains!663 (ListLongMap!15847 (_ BitVec 64) V!42761 (_ BitVec 64)) Unit!36691)

(assert (=> b!1123766 (= lt!499054 (addStillContains!663 lt!499055 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun b!1123767 () Bool)

(declare-fun e!639728 () Bool)

(declare-fun e!639734 () Bool)

(assert (=> b!1123767 (= e!639728 (not e!639734))))

(declare-fun res!750832 () Bool)

(assert (=> b!1123767 (=> res!750832 e!639734)))

(assert (=> b!1123767 (= res!750832 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73240 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1123767 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!499050 () Unit!36691)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73240 (_ BitVec 64) (_ BitVec 32)) Unit!36691)

(assert (=> b!1123767 (= lt!499050 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1123768 () Bool)

(declare-fun call!47345 () ListLongMap!15847)

(declare-fun call!47344 () ListLongMap!15847)

(declare-fun -!1078 (ListLongMap!15847 (_ BitVec 64)) ListLongMap!15847)

(assert (=> b!1123768 (= e!639738 (= call!47344 (-!1078 call!47345 k0!934)))))

(declare-fun b!1123769 () Bool)

(declare-fun res!750837 () Bool)

(declare-fun e!639729 () Bool)

(assert (=> b!1123769 (=> (not res!750837) (not e!639729))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1123769 (= res!750837 (validKeyInArray!0 k0!934))))

(declare-fun res!750829 () Bool)

(assert (=> start!97988 (=> (not res!750829) (not e!639729))))

(assert (=> start!97988 (= res!750829 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35811 _keys!1208))))))

(assert (=> start!97988 e!639729))

(assert (=> start!97988 tp_is_empty!28225))

(declare-fun array_inv!27150 (array!73240) Bool)

(assert (=> start!97988 (array_inv!27150 _keys!1208)))

(assert (=> start!97988 true))

(assert (=> start!97988 tp!83789))

(declare-fun e!639736 () Bool)

(declare-fun array_inv!27151 (array!73242) Bool)

(assert (=> start!97988 (and (array_inv!27151 _values!996) e!639736)))

(declare-fun b!1123770 () Bool)

(declare-fun res!750830 () Bool)

(assert (=> b!1123770 (=> (not res!750830) (not e!639729))))

(assert (=> b!1123770 (= res!750830 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35811 _keys!1208))))))

(declare-fun lt!499053 () array!73240)

(declare-fun lt!499051 () array!73242)

(declare-fun bm!47341 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4445 (array!73240 array!73242 (_ BitVec 32) (_ BitVec 32) V!42761 V!42761 (_ BitVec 32) Int) ListLongMap!15847)

(assert (=> bm!47341 (= call!47344 (getCurrentListMapNoExtraKeys!4445 lt!499053 lt!499051 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1123771 () Bool)

(declare-fun mapRes!44155 () Bool)

(assert (=> b!1123771 (= e!639736 (and e!639730 mapRes!44155))))

(declare-fun condMapEmpty!44155 () Bool)

(declare-fun mapDefault!44155 () ValueCell!13403)

(assert (=> b!1123771 (= condMapEmpty!44155 (= (arr!35274 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13403)) mapDefault!44155)))))

(declare-fun b!1123772 () Bool)

(declare-fun res!750838 () Bool)

(assert (=> b!1123772 (=> (not res!750838) (not e!639729))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1123772 (= res!750838 (validMask!0 mask!1564))))

(declare-fun b!1123773 () Bool)

(declare-fun res!750828 () Bool)

(assert (=> b!1123773 (=> (not res!750828) (not e!639729))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73240 (_ BitVec 32)) Bool)

(assert (=> b!1123773 (= res!750828 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1123774 () Bool)

(assert (=> b!1123774 (= e!639734 e!639737)))

(declare-fun res!750840 () Bool)

(assert (=> b!1123774 (=> res!750840 e!639737)))

(assert (=> b!1123774 (= res!750840 (not (= from!1455 i!673)))))

(declare-fun lt!499049 () ListLongMap!15847)

(assert (=> b!1123774 (= lt!499049 (getCurrentListMapNoExtraKeys!4445 lt!499053 lt!499051 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2471 (Int (_ BitVec 64)) V!42761)

(assert (=> b!1123774 (= lt!499051 (array!73243 (store (arr!35274 _values!996) i!673 (ValueCellFull!13403 (dynLambda!2471 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35812 _values!996)))))

(declare-fun lt!499052 () ListLongMap!15847)

(assert (=> b!1123774 (= lt!499052 (getCurrentListMapNoExtraKeys!4445 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1123775 () Bool)

(declare-fun res!750835 () Bool)

(assert (=> b!1123775 (=> (not res!750835) (not e!639729))))

(declare-datatypes ((List!24641 0))(
  ( (Nil!24638) (Cons!24637 (h!25846 (_ BitVec 64)) (t!35319 List!24641)) )
))
(declare-fun arrayNoDuplicates!0 (array!73240 (_ BitVec 32) List!24641) Bool)

(assert (=> b!1123775 (= res!750835 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24638))))

(declare-fun mapIsEmpty!44155 () Bool)

(assert (=> mapIsEmpty!44155 mapRes!44155))

(declare-fun b!1123776 () Bool)

(assert (=> b!1123776 (= e!639738 (= call!47344 call!47345))))

(declare-fun b!1123777 () Bool)

(assert (=> b!1123777 (= e!639732 e!639733)))

(declare-fun res!750834 () Bool)

(assert (=> b!1123777 (=> res!750834 e!639733)))

(assert (=> b!1123777 (= res!750834 (not (contains!6411 lt!499055 k0!934)))))

(assert (=> b!1123777 (= lt!499055 (getCurrentListMapNoExtraKeys!4445 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1123778 () Bool)

(declare-fun res!750836 () Bool)

(assert (=> b!1123778 (=> (not res!750836) (not e!639729))))

(assert (=> b!1123778 (= res!750836 (and (= (size!35812 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35811 _keys!1208) (size!35812 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1123779 () Bool)

(assert (=> b!1123779 (= e!639729 e!639728)))

(declare-fun res!750841 () Bool)

(assert (=> b!1123779 (=> (not res!750841) (not e!639728))))

(assert (=> b!1123779 (= res!750841 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!499053 mask!1564))))

(assert (=> b!1123779 (= lt!499053 (array!73241 (store (arr!35273 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35811 _keys!1208)))))

(declare-fun b!1123780 () Bool)

(declare-fun res!750839 () Bool)

(assert (=> b!1123780 (=> (not res!750839) (not e!639729))))

(assert (=> b!1123780 (= res!750839 (= (select (arr!35273 _keys!1208) i!673) k0!934))))

(declare-fun bm!47342 () Bool)

(assert (=> bm!47342 (= call!47345 (getCurrentListMapNoExtraKeys!4445 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1123781 () Bool)

(declare-fun e!639735 () Bool)

(assert (=> b!1123781 (= e!639735 tp_is_empty!28225)))

(declare-fun mapNonEmpty!44155 () Bool)

(declare-fun tp!83788 () Bool)

(assert (=> mapNonEmpty!44155 (= mapRes!44155 (and tp!83788 e!639735))))

(declare-fun mapKey!44155 () (_ BitVec 32))

(declare-fun mapRest!44155 () (Array (_ BitVec 32) ValueCell!13403))

(declare-fun mapValue!44155 () ValueCell!13403)

(assert (=> mapNonEmpty!44155 (= (arr!35274 _values!996) (store mapRest!44155 mapKey!44155 mapValue!44155))))

(declare-fun b!1123782 () Bool)

(declare-fun res!750827 () Bool)

(assert (=> b!1123782 (=> (not res!750827) (not e!639728))))

(assert (=> b!1123782 (= res!750827 (arrayNoDuplicates!0 lt!499053 #b00000000000000000000000000000000 Nil!24638))))

(assert (= (and start!97988 res!750829) b!1123772))

(assert (= (and b!1123772 res!750838) b!1123778))

(assert (= (and b!1123778 res!750836) b!1123773))

(assert (= (and b!1123773 res!750828) b!1123775))

(assert (= (and b!1123775 res!750835) b!1123770))

(assert (= (and b!1123770 res!750830) b!1123769))

(assert (= (and b!1123769 res!750837) b!1123780))

(assert (= (and b!1123780 res!750839) b!1123779))

(assert (= (and b!1123779 res!750841) b!1123782))

(assert (= (and b!1123782 res!750827) b!1123767))

(assert (= (and b!1123767 (not res!750832)) b!1123774))

(assert (= (and b!1123774 (not res!750840)) b!1123765))

(assert (= (and b!1123765 c!109506) b!1123768))

(assert (= (and b!1123765 (not c!109506)) b!1123776))

(assert (= (or b!1123768 b!1123776) bm!47341))

(assert (= (or b!1123768 b!1123776) bm!47342))

(assert (= (and b!1123765 (not res!750831)) b!1123777))

(assert (= (and b!1123777 (not res!750834)) b!1123764))

(assert (= (and b!1123764 (not res!750833)) b!1123766))

(assert (= (and b!1123771 condMapEmpty!44155) mapIsEmpty!44155))

(assert (= (and b!1123771 (not condMapEmpty!44155)) mapNonEmpty!44155))

(get-info :version)

(assert (= (and mapNonEmpty!44155 ((_ is ValueCellFull!13403) mapValue!44155)) b!1123781))

(assert (= (and b!1123771 ((_ is ValueCellFull!13403) mapDefault!44155)) b!1123763))

(assert (= start!97988 b!1123771))

(declare-fun b_lambda!18647 () Bool)

(assert (=> (not b_lambda!18647) (not b!1123774)))

(declare-fun t!35317 () Bool)

(declare-fun tb!8499 () Bool)

(assert (=> (and start!97988 (= defaultEntry!1004 defaultEntry!1004) t!35317) tb!8499))

(declare-fun result!17567 () Bool)

(assert (=> tb!8499 (= result!17567 tp_is_empty!28225)))

(assert (=> b!1123774 t!35317))

(declare-fun b_and!38153 () Bool)

(assert (= b_and!38151 (and (=> t!35317 result!17567) b_and!38153)))

(declare-fun m!1037649 () Bool)

(assert (=> b!1123773 m!1037649))

(declare-fun m!1037651 () Bool)

(assert (=> b!1123775 m!1037651))

(declare-fun m!1037653 () Bool)

(assert (=> b!1123772 m!1037653))

(declare-fun m!1037655 () Bool)

(assert (=> bm!47341 m!1037655))

(declare-fun m!1037657 () Bool)

(assert (=> b!1123779 m!1037657))

(declare-fun m!1037659 () Bool)

(assert (=> b!1123779 m!1037659))

(declare-fun m!1037661 () Bool)

(assert (=> b!1123782 m!1037661))

(declare-fun m!1037663 () Bool)

(assert (=> b!1123765 m!1037663))

(declare-fun m!1037665 () Bool)

(assert (=> b!1123765 m!1037665))

(declare-fun m!1037667 () Bool)

(assert (=> b!1123768 m!1037667))

(declare-fun m!1037669 () Bool)

(assert (=> b!1123767 m!1037669))

(declare-fun m!1037671 () Bool)

(assert (=> b!1123767 m!1037671))

(declare-fun m!1037673 () Bool)

(assert (=> b!1123769 m!1037673))

(declare-fun m!1037675 () Bool)

(assert (=> b!1123766 m!1037675))

(assert (=> b!1123766 m!1037675))

(declare-fun m!1037677 () Bool)

(assert (=> b!1123766 m!1037677))

(declare-fun m!1037679 () Bool)

(assert (=> b!1123766 m!1037679))

(declare-fun m!1037681 () Bool)

(assert (=> b!1123780 m!1037681))

(declare-fun m!1037683 () Bool)

(assert (=> start!97988 m!1037683))

(declare-fun m!1037685 () Bool)

(assert (=> start!97988 m!1037685))

(declare-fun m!1037687 () Bool)

(assert (=> b!1123774 m!1037687))

(declare-fun m!1037689 () Bool)

(assert (=> b!1123774 m!1037689))

(declare-fun m!1037691 () Bool)

(assert (=> b!1123774 m!1037691))

(declare-fun m!1037693 () Bool)

(assert (=> b!1123774 m!1037693))

(declare-fun m!1037695 () Bool)

(assert (=> bm!47342 m!1037695))

(declare-fun m!1037697 () Bool)

(assert (=> mapNonEmpty!44155 m!1037697))

(declare-fun m!1037699 () Bool)

(assert (=> b!1123777 m!1037699))

(assert (=> b!1123777 m!1037695))

(check-sat (not bm!47342) (not b_next!23695) b_and!38153 (not b!1123779) (not b!1123768) (not bm!47341) (not b!1123765) tp_is_empty!28225 (not b!1123777) (not b!1123773) (not mapNonEmpty!44155) (not b!1123775) (not start!97988) (not b!1123769) (not b_lambda!18647) (not b!1123766) (not b!1123767) (not b!1123782) (not b!1123772) (not b!1123774))
(check-sat b_and!38153 (not b_next!23695))
