; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100418 () Bool)

(assert start!100418)

(declare-fun b_free!25747 () Bool)

(declare-fun b_next!25747 () Bool)

(assert (=> start!100418 (= b_free!25747 (not b_next!25747))))

(declare-fun tp!90230 () Bool)

(declare-fun b_and!42359 () Bool)

(assert (=> start!100418 (= tp!90230 b_and!42359)))

(declare-fun mapNonEmpty!47519 () Bool)

(declare-fun mapRes!47519 () Bool)

(declare-fun tp!90231 () Bool)

(declare-fun e!680878 () Bool)

(assert (=> mapNonEmpty!47519 (= mapRes!47519 (and tp!90231 e!680878))))

(declare-fun mapKey!47519 () (_ BitVec 32))

(declare-datatypes ((V!45729 0))(
  ( (V!45730 (val!15282 Int)) )
))
(declare-datatypes ((ValueCell!14516 0))(
  ( (ValueCellFull!14516 (v!17919 V!45729)) (EmptyCell!14516) )
))
(declare-fun mapValue!47519 () ValueCell!14516)

(declare-fun mapRest!47519 () (Array (_ BitVec 32) ValueCell!14516))

(declare-datatypes ((array!77606 0))(
  ( (array!77607 (arr!37448 (Array (_ BitVec 32) ValueCell!14516)) (size!37986 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77606)

(assert (=> mapNonEmpty!47519 (= (arr!37448 _values!996) (store mapRest!47519 mapKey!47519 mapValue!47519))))

(declare-fun b!1198712 () Bool)

(declare-fun res!797841 () Bool)

(declare-fun e!680884 () Bool)

(assert (=> b!1198712 (=> (not res!797841) (not e!680884))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1198712 (= res!797841 (validMask!0 mask!1564))))

(declare-fun b!1198713 () Bool)

(declare-fun res!797845 () Bool)

(assert (=> b!1198713 (=> (not res!797845) (not e!680884))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!77608 0))(
  ( (array!77609 (arr!37449 (Array (_ BitVec 32) (_ BitVec 64))) (size!37987 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77608)

(assert (=> b!1198713 (= res!797845 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37987 _keys!1208))))))

(declare-fun b!1198714 () Bool)

(declare-fun res!797839 () Bool)

(assert (=> b!1198714 (=> (not res!797839) (not e!680884))))

(declare-datatypes ((List!26434 0))(
  ( (Nil!26431) (Cons!26430 (h!27639 (_ BitVec 64)) (t!39152 List!26434)) )
))
(declare-fun arrayNoDuplicates!0 (array!77608 (_ BitVec 32) List!26434) Bool)

(assert (=> b!1198714 (= res!797839 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26431))))

(declare-fun b!1198715 () Bool)

(declare-fun e!680881 () Bool)

(assert (=> b!1198715 (= e!680881 true)))

(declare-fun zeroValue!944 () V!45729)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!543414 () array!77608)

(declare-fun minValue!944 () V!45729)

(declare-datatypes ((tuple2!19646 0))(
  ( (tuple2!19647 (_1!9834 (_ BitVec 64)) (_2!9834 V!45729)) )
))
(declare-datatypes ((List!26435 0))(
  ( (Nil!26432) (Cons!26431 (h!27640 tuple2!19646) (t!39153 List!26435)) )
))
(declare-datatypes ((ListLongMap!17615 0))(
  ( (ListLongMap!17616 (toList!8823 List!26435)) )
))
(declare-fun lt!543415 () ListLongMap!17615)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5272 (array!77608 array!77606 (_ BitVec 32) (_ BitVec 32) V!45729 V!45729 (_ BitVec 32) Int) ListLongMap!17615)

(declare-fun dynLambda!3152 (Int (_ BitVec 64)) V!45729)

(assert (=> b!1198715 (= lt!543415 (getCurrentListMapNoExtraKeys!5272 lt!543414 (array!77607 (store (arr!37448 _values!996) i!673 (ValueCellFull!14516 (dynLambda!3152 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37986 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!543412 () ListLongMap!17615)

(assert (=> b!1198715 (= lt!543412 (getCurrentListMapNoExtraKeys!5272 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1198716 () Bool)

(declare-fun e!680883 () Bool)

(assert (=> b!1198716 (= e!680884 e!680883)))

(declare-fun res!797840 () Bool)

(assert (=> b!1198716 (=> (not res!797840) (not e!680883))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77608 (_ BitVec 32)) Bool)

(assert (=> b!1198716 (= res!797840 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543414 mask!1564))))

(assert (=> b!1198716 (= lt!543414 (array!77609 (store (arr!37449 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37987 _keys!1208)))))

(declare-fun b!1198717 () Bool)

(declare-fun e!680880 () Bool)

(declare-fun e!680879 () Bool)

(assert (=> b!1198717 (= e!680880 (and e!680879 mapRes!47519))))

(declare-fun condMapEmpty!47519 () Bool)

(declare-fun mapDefault!47519 () ValueCell!14516)

(assert (=> b!1198717 (= condMapEmpty!47519 (= (arr!37448 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14516)) mapDefault!47519)))))

(declare-fun res!797838 () Bool)

(assert (=> start!100418 (=> (not res!797838) (not e!680884))))

(assert (=> start!100418 (= res!797838 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37987 _keys!1208))))))

(assert (=> start!100418 e!680884))

(declare-fun tp_is_empty!30451 () Bool)

(assert (=> start!100418 tp_is_empty!30451))

(declare-fun array_inv!28656 (array!77608) Bool)

(assert (=> start!100418 (array_inv!28656 _keys!1208)))

(assert (=> start!100418 true))

(assert (=> start!100418 tp!90230))

(declare-fun array_inv!28657 (array!77606) Bool)

(assert (=> start!100418 (and (array_inv!28657 _values!996) e!680880)))

(declare-fun b!1198718 () Bool)

(declare-fun res!797842 () Bool)

(assert (=> b!1198718 (=> (not res!797842) (not e!680884))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1198718 (= res!797842 (= (select (arr!37449 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!47519 () Bool)

(assert (=> mapIsEmpty!47519 mapRes!47519))

(declare-fun b!1198719 () Bool)

(assert (=> b!1198719 (= e!680883 (not e!680881))))

(declare-fun res!797844 () Bool)

(assert (=> b!1198719 (=> res!797844 e!680881)))

(assert (=> b!1198719 (= res!797844 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77608 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1198719 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39607 0))(
  ( (Unit!39608) )
))
(declare-fun lt!543413 () Unit!39607)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77608 (_ BitVec 64) (_ BitVec 32)) Unit!39607)

(assert (=> b!1198719 (= lt!543413 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1198720 () Bool)

(assert (=> b!1198720 (= e!680879 tp_is_empty!30451)))

(declare-fun b!1198721 () Bool)

(declare-fun res!797837 () Bool)

(assert (=> b!1198721 (=> (not res!797837) (not e!680883))))

(assert (=> b!1198721 (= res!797837 (arrayNoDuplicates!0 lt!543414 #b00000000000000000000000000000000 Nil!26431))))

(declare-fun b!1198722 () Bool)

(assert (=> b!1198722 (= e!680878 tp_is_empty!30451)))

(declare-fun b!1198723 () Bool)

(declare-fun res!797846 () Bool)

(assert (=> b!1198723 (=> (not res!797846) (not e!680884))))

(assert (=> b!1198723 (= res!797846 (and (= (size!37986 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37987 _keys!1208) (size!37986 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1198724 () Bool)

(declare-fun res!797843 () Bool)

(assert (=> b!1198724 (=> (not res!797843) (not e!680884))))

(assert (=> b!1198724 (= res!797843 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1198725 () Bool)

(declare-fun res!797847 () Bool)

(assert (=> b!1198725 (=> (not res!797847) (not e!680884))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1198725 (= res!797847 (validKeyInArray!0 k0!934))))

(assert (= (and start!100418 res!797838) b!1198712))

(assert (= (and b!1198712 res!797841) b!1198723))

(assert (= (and b!1198723 res!797846) b!1198724))

(assert (= (and b!1198724 res!797843) b!1198714))

(assert (= (and b!1198714 res!797839) b!1198713))

(assert (= (and b!1198713 res!797845) b!1198725))

(assert (= (and b!1198725 res!797847) b!1198718))

(assert (= (and b!1198718 res!797842) b!1198716))

(assert (= (and b!1198716 res!797840) b!1198721))

(assert (= (and b!1198721 res!797837) b!1198719))

(assert (= (and b!1198719 (not res!797844)) b!1198715))

(assert (= (and b!1198717 condMapEmpty!47519) mapIsEmpty!47519))

(assert (= (and b!1198717 (not condMapEmpty!47519)) mapNonEmpty!47519))

(get-info :version)

(assert (= (and mapNonEmpty!47519 ((_ is ValueCellFull!14516) mapValue!47519)) b!1198722))

(assert (= (and b!1198717 ((_ is ValueCellFull!14516) mapDefault!47519)) b!1198720))

(assert (= start!100418 b!1198717))

(declare-fun b_lambda!20925 () Bool)

(assert (=> (not b_lambda!20925) (not b!1198715)))

(declare-fun t!39151 () Bool)

(declare-fun tb!10539 () Bool)

(assert (=> (and start!100418 (= defaultEntry!1004 defaultEntry!1004) t!39151) tb!10539))

(declare-fun result!21663 () Bool)

(assert (=> tb!10539 (= result!21663 tp_is_empty!30451)))

(assert (=> b!1198715 t!39151))

(declare-fun b_and!42361 () Bool)

(assert (= b_and!42359 (and (=> t!39151 result!21663) b_and!42361)))

(declare-fun m!1104901 () Bool)

(assert (=> b!1198721 m!1104901))

(declare-fun m!1104903 () Bool)

(assert (=> b!1198715 m!1104903))

(declare-fun m!1104905 () Bool)

(assert (=> b!1198715 m!1104905))

(declare-fun m!1104907 () Bool)

(assert (=> b!1198715 m!1104907))

(declare-fun m!1104909 () Bool)

(assert (=> b!1198715 m!1104909))

(declare-fun m!1104911 () Bool)

(assert (=> b!1198725 m!1104911))

(declare-fun m!1104913 () Bool)

(assert (=> mapNonEmpty!47519 m!1104913))

(declare-fun m!1104915 () Bool)

(assert (=> b!1198724 m!1104915))

(declare-fun m!1104917 () Bool)

(assert (=> b!1198712 m!1104917))

(declare-fun m!1104919 () Bool)

(assert (=> b!1198719 m!1104919))

(declare-fun m!1104921 () Bool)

(assert (=> b!1198719 m!1104921))

(declare-fun m!1104923 () Bool)

(assert (=> b!1198714 m!1104923))

(declare-fun m!1104925 () Bool)

(assert (=> b!1198716 m!1104925))

(declare-fun m!1104927 () Bool)

(assert (=> b!1198716 m!1104927))

(declare-fun m!1104929 () Bool)

(assert (=> b!1198718 m!1104929))

(declare-fun m!1104931 () Bool)

(assert (=> start!100418 m!1104931))

(declare-fun m!1104933 () Bool)

(assert (=> start!100418 m!1104933))

(check-sat (not b!1198725) (not mapNonEmpty!47519) (not b!1198724) (not b!1198716) b_and!42361 (not b!1198719) (not b_next!25747) (not b!1198721) (not start!100418) (not b!1198715) (not b!1198712) (not b_lambda!20925) (not b!1198714) tp_is_empty!30451)
(check-sat b_and!42361 (not b_next!25747))
