; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100158 () Bool)

(assert start!100158)

(declare-fun b_free!25501 () Bool)

(declare-fun b_next!25501 () Bool)

(assert (=> start!100158 (= b_free!25501 (not b_next!25501))))

(declare-fun tp!89217 () Bool)

(declare-fun b_and!41871 () Bool)

(assert (=> start!100158 (= tp!89217 b_and!41871)))

(declare-fun mapIsEmpty!46874 () Bool)

(declare-fun mapRes!46874 () Bool)

(assert (=> mapIsEmpty!46874 mapRes!46874))

(declare-fun b!1190736 () Bool)

(declare-fun e!677086 () Bool)

(declare-fun e!677083 () Bool)

(assert (=> b!1190736 (= e!677086 (not e!677083))))

(declare-fun res!791464 () Bool)

(assert (=> b!1190736 (=> res!791464 e!677083)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1190736 (= res!791464 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!76899 0))(
  ( (array!76900 (arr!37093 (Array (_ BitVec 32) (_ BitVec 64))) (size!37630 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76899)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!76899 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1190736 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39441 0))(
  ( (Unit!39442) )
))
(declare-fun lt!541558 () Unit!39441)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76899 (_ BitVec 64) (_ BitVec 32)) Unit!39441)

(assert (=> b!1190736 (= lt!541558 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1190737 () Bool)

(declare-fun e!677085 () Bool)

(declare-fun tp_is_empty!30031 () Bool)

(assert (=> b!1190737 (= e!677085 tp_is_empty!30031)))

(declare-fun b!1190738 () Bool)

(declare-fun res!791465 () Bool)

(declare-fun e!677087 () Bool)

(assert (=> b!1190738 (=> (not res!791465) (not e!677087))))

(assert (=> b!1190738 (= res!791465 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37630 _keys!1208))))))

(declare-fun b!1190739 () Bool)

(declare-fun res!791468 () Bool)

(assert (=> b!1190739 (=> (not res!791468) (not e!677087))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1190739 (= res!791468 (validMask!0 mask!1564))))

(declare-fun b!1190740 () Bool)

(declare-fun e!677089 () Bool)

(assert (=> b!1190740 (= e!677089 tp_is_empty!30031)))

(declare-fun mapNonEmpty!46874 () Bool)

(declare-fun tp!89216 () Bool)

(assert (=> mapNonEmpty!46874 (= mapRes!46874 (and tp!89216 e!677085))))

(declare-datatypes ((V!45169 0))(
  ( (V!45170 (val!15072 Int)) )
))
(declare-datatypes ((ValueCell!14306 0))(
  ( (ValueCellFull!14306 (v!17706 V!45169)) (EmptyCell!14306) )
))
(declare-fun mapValue!46874 () ValueCell!14306)

(declare-fun mapKey!46874 () (_ BitVec 32))

(declare-datatypes ((array!76901 0))(
  ( (array!76902 (arr!37094 (Array (_ BitVec 32) ValueCell!14306)) (size!37631 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76901)

(declare-fun mapRest!46874 () (Array (_ BitVec 32) ValueCell!14306))

(assert (=> mapNonEmpty!46874 (= (arr!37094 _values!996) (store mapRest!46874 mapKey!46874 mapValue!46874))))

(declare-fun b!1190741 () Bool)

(declare-fun res!791462 () Bool)

(assert (=> b!1190741 (=> (not res!791462) (not e!677087))))

(assert (=> b!1190741 (= res!791462 (= (select (arr!37093 _keys!1208) i!673) k0!934))))

(declare-fun b!1190742 () Bool)

(declare-fun res!791471 () Bool)

(assert (=> b!1190742 (=> (not res!791471) (not e!677087))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1190742 (= res!791471 (validKeyInArray!0 k0!934))))

(declare-fun b!1190744 () Bool)

(assert (=> b!1190744 (= e!677087 e!677086)))

(declare-fun res!791469 () Bool)

(assert (=> b!1190744 (=> (not res!791469) (not e!677086))))

(declare-fun lt!541553 () array!76899)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76899 (_ BitVec 32)) Bool)

(assert (=> b!1190744 (= res!791469 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541553 mask!1564))))

(assert (=> b!1190744 (= lt!541553 (array!76900 (store (arr!37093 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37630 _keys!1208)))))

(declare-fun b!1190745 () Bool)

(declare-fun e!677090 () Bool)

(assert (=> b!1190745 (= e!677083 e!677090)))

(declare-fun res!791463 () Bool)

(assert (=> b!1190745 (=> res!791463 e!677090)))

(assert (=> b!1190745 (= res!791463 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45169)

(declare-datatypes ((tuple2!19392 0))(
  ( (tuple2!19393 (_1!9707 (_ BitVec 64)) (_2!9707 V!45169)) )
))
(declare-datatypes ((List!26135 0))(
  ( (Nil!26132) (Cons!26131 (h!27349 tuple2!19392) (t!38620 List!26135)) )
))
(declare-datatypes ((ListLongMap!17369 0))(
  ( (ListLongMap!17370 (toList!8700 List!26135)) )
))
(declare-fun lt!541557 () ListLongMap!17369)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!541556 () array!76901)

(declare-fun minValue!944 () V!45169)

(declare-fun getCurrentListMapNoExtraKeys!5168 (array!76899 array!76901 (_ BitVec 32) (_ BitVec 32) V!45169 V!45169 (_ BitVec 32) Int) ListLongMap!17369)

(assert (=> b!1190745 (= lt!541557 (getCurrentListMapNoExtraKeys!5168 lt!541553 lt!541556 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3125 (Int (_ BitVec 64)) V!45169)

(assert (=> b!1190745 (= lt!541556 (array!76902 (store (arr!37094 _values!996) i!673 (ValueCellFull!14306 (dynLambda!3125 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37631 _values!996)))))

(declare-fun lt!541554 () ListLongMap!17369)

(assert (=> b!1190745 (= lt!541554 (getCurrentListMapNoExtraKeys!5168 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1190746 () Bool)

(assert (=> b!1190746 (= e!677090 true)))

(declare-fun -!1716 (ListLongMap!17369 (_ BitVec 64)) ListLongMap!17369)

(assert (=> b!1190746 (= (getCurrentListMapNoExtraKeys!5168 lt!541553 lt!541556 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1716 (getCurrentListMapNoExtraKeys!5168 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!541555 () Unit!39441)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!931 (array!76899 array!76901 (_ BitVec 32) (_ BitVec 32) V!45169 V!45169 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39441)

(assert (=> b!1190746 (= lt!541555 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!931 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1190747 () Bool)

(declare-fun res!791470 () Bool)

(assert (=> b!1190747 (=> (not res!791470) (not e!677087))))

(assert (=> b!1190747 (= res!791470 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1190748 () Bool)

(declare-fun e!677084 () Bool)

(assert (=> b!1190748 (= e!677084 (and e!677089 mapRes!46874))))

(declare-fun condMapEmpty!46874 () Bool)

(declare-fun mapDefault!46874 () ValueCell!14306)

(assert (=> b!1190748 (= condMapEmpty!46874 (= (arr!37094 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14306)) mapDefault!46874)))))

(declare-fun b!1190749 () Bool)

(declare-fun res!791467 () Bool)

(assert (=> b!1190749 (=> (not res!791467) (not e!677087))))

(assert (=> b!1190749 (= res!791467 (and (= (size!37631 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37630 _keys!1208) (size!37631 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1190750 () Bool)

(declare-fun res!791461 () Bool)

(assert (=> b!1190750 (=> (not res!791461) (not e!677086))))

(declare-datatypes ((List!26136 0))(
  ( (Nil!26133) (Cons!26132 (h!27350 (_ BitVec 64)) (t!38621 List!26136)) )
))
(declare-fun arrayNoDuplicates!0 (array!76899 (_ BitVec 32) List!26136) Bool)

(assert (=> b!1190750 (= res!791461 (arrayNoDuplicates!0 lt!541553 #b00000000000000000000000000000000 Nil!26133))))

(declare-fun res!791466 () Bool)

(assert (=> start!100158 (=> (not res!791466) (not e!677087))))

(assert (=> start!100158 (= res!791466 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37630 _keys!1208))))))

(assert (=> start!100158 e!677087))

(assert (=> start!100158 tp_is_empty!30031))

(declare-fun array_inv!28360 (array!76899) Bool)

(assert (=> start!100158 (array_inv!28360 _keys!1208)))

(assert (=> start!100158 true))

(assert (=> start!100158 tp!89217))

(declare-fun array_inv!28361 (array!76901) Bool)

(assert (=> start!100158 (and (array_inv!28361 _values!996) e!677084)))

(declare-fun b!1190743 () Bool)

(declare-fun res!791460 () Bool)

(assert (=> b!1190743 (=> (not res!791460) (not e!677087))))

(assert (=> b!1190743 (= res!791460 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26133))))

(assert (= (and start!100158 res!791466) b!1190739))

(assert (= (and b!1190739 res!791468) b!1190749))

(assert (= (and b!1190749 res!791467) b!1190747))

(assert (= (and b!1190747 res!791470) b!1190743))

(assert (= (and b!1190743 res!791460) b!1190738))

(assert (= (and b!1190738 res!791465) b!1190742))

(assert (= (and b!1190742 res!791471) b!1190741))

(assert (= (and b!1190741 res!791462) b!1190744))

(assert (= (and b!1190744 res!791469) b!1190750))

(assert (= (and b!1190750 res!791461) b!1190736))

(assert (= (and b!1190736 (not res!791464)) b!1190745))

(assert (= (and b!1190745 (not res!791463)) b!1190746))

(assert (= (and b!1190748 condMapEmpty!46874) mapIsEmpty!46874))

(assert (= (and b!1190748 (not condMapEmpty!46874)) mapNonEmpty!46874))

(get-info :version)

(assert (= (and mapNonEmpty!46874 ((_ is ValueCellFull!14306) mapValue!46874)) b!1190737))

(assert (= (and b!1190748 ((_ is ValueCellFull!14306) mapDefault!46874)) b!1190740))

(assert (= start!100158 b!1190748))

(declare-fun b_lambda!20639 () Bool)

(assert (=> (not b_lambda!20639) (not b!1190745)))

(declare-fun t!38619 () Bool)

(declare-fun tb!10305 () Bool)

(assert (=> (and start!100158 (= defaultEntry!1004 defaultEntry!1004) t!38619) tb!10305))

(declare-fun result!21185 () Bool)

(assert (=> tb!10305 (= result!21185 tp_is_empty!30031)))

(assert (=> b!1190745 t!38619))

(declare-fun b_and!41873 () Bool)

(assert (= b_and!41871 (and (=> t!38619 result!21185) b_and!41873)))

(declare-fun m!1099695 () Bool)

(assert (=> b!1190744 m!1099695))

(declare-fun m!1099697 () Bool)

(assert (=> b!1190744 m!1099697))

(declare-fun m!1099699 () Bool)

(assert (=> b!1190742 m!1099699))

(declare-fun m!1099701 () Bool)

(assert (=> b!1190745 m!1099701))

(declare-fun m!1099703 () Bool)

(assert (=> b!1190745 m!1099703))

(declare-fun m!1099705 () Bool)

(assert (=> b!1190745 m!1099705))

(declare-fun m!1099707 () Bool)

(assert (=> b!1190745 m!1099707))

(declare-fun m!1099709 () Bool)

(assert (=> b!1190746 m!1099709))

(declare-fun m!1099711 () Bool)

(assert (=> b!1190746 m!1099711))

(assert (=> b!1190746 m!1099711))

(declare-fun m!1099713 () Bool)

(assert (=> b!1190746 m!1099713))

(declare-fun m!1099715 () Bool)

(assert (=> b!1190746 m!1099715))

(declare-fun m!1099717 () Bool)

(assert (=> b!1190743 m!1099717))

(declare-fun m!1099719 () Bool)

(assert (=> start!100158 m!1099719))

(declare-fun m!1099721 () Bool)

(assert (=> start!100158 m!1099721))

(declare-fun m!1099723 () Bool)

(assert (=> b!1190747 m!1099723))

(declare-fun m!1099725 () Bool)

(assert (=> mapNonEmpty!46874 m!1099725))

(declare-fun m!1099727 () Bool)

(assert (=> b!1190736 m!1099727))

(declare-fun m!1099729 () Bool)

(assert (=> b!1190736 m!1099729))

(declare-fun m!1099731 () Bool)

(assert (=> b!1190741 m!1099731))

(declare-fun m!1099733 () Bool)

(assert (=> b!1190750 m!1099733))

(declare-fun m!1099735 () Bool)

(assert (=> b!1190739 m!1099735))

(check-sat (not b!1190750) (not b_next!25501) (not b!1190744) (not b!1190747) (not b!1190745) (not b!1190742) (not b!1190736) (not b!1190743) (not mapNonEmpty!46874) (not b!1190739) (not b!1190746) (not b_lambda!20639) tp_is_empty!30031 b_and!41873 (not start!100158))
(check-sat b_and!41873 (not b_next!25501))
