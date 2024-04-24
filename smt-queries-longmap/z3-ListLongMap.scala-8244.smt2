; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100648 () Bool)

(assert start!100648)

(declare-fun b_free!25735 () Bool)

(declare-fun b_next!25735 () Bool)

(assert (=> start!100648 (= b_free!25735 (not b_next!25735))))

(declare-fun tp!90194 () Bool)

(declare-fun b_and!42359 () Bool)

(assert (=> start!100648 (= tp!90194 b_and!42359)))

(declare-fun b!1199861 () Bool)

(declare-fun e!681668 () Bool)

(declare-fun tp_is_empty!30439 () Bool)

(assert (=> b!1199861 (= e!681668 tp_is_empty!30439)))

(declare-fun b!1199862 () Bool)

(declare-fun e!681662 () Bool)

(declare-fun e!681667 () Bool)

(declare-fun mapRes!47501 () Bool)

(assert (=> b!1199862 (= e!681662 (and e!681667 mapRes!47501))))

(declare-fun condMapEmpty!47501 () Bool)

(declare-datatypes ((V!45713 0))(
  ( (V!45714 (val!15276 Int)) )
))
(declare-datatypes ((ValueCell!14510 0))(
  ( (ValueCellFull!14510 (v!17910 V!45713)) (EmptyCell!14510) )
))
(declare-datatypes ((array!77693 0))(
  ( (array!77694 (arr!37485 (Array (_ BitVec 32) ValueCell!14510)) (size!38022 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77693)

(declare-fun mapDefault!47501 () ValueCell!14510)

(assert (=> b!1199862 (= condMapEmpty!47501 (= (arr!37485 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14510)) mapDefault!47501)))))

(declare-fun b!1199863 () Bool)

(declare-fun res!798215 () Bool)

(declare-fun e!681665 () Bool)

(assert (=> b!1199863 (=> (not res!798215) (not e!681665))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-datatypes ((array!77695 0))(
  ( (array!77696 (arr!37486 (Array (_ BitVec 32) (_ BitVec 64))) (size!38023 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77695)

(assert (=> b!1199863 (= res!798215 (= (select (arr!37486 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!47501 () Bool)

(declare-fun tp!90195 () Bool)

(assert (=> mapNonEmpty!47501 (= mapRes!47501 (and tp!90195 e!681668))))

(declare-fun mapKey!47501 () (_ BitVec 32))

(declare-fun mapValue!47501 () ValueCell!14510)

(declare-fun mapRest!47501 () (Array (_ BitVec 32) ValueCell!14510))

(assert (=> mapNonEmpty!47501 (= (arr!37485 _values!996) (store mapRest!47501 mapKey!47501 mapValue!47501))))

(declare-fun res!798221 () Bool)

(assert (=> start!100648 (=> (not res!798221) (not e!681665))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100648 (= res!798221 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38023 _keys!1208))))))

(assert (=> start!100648 e!681665))

(assert (=> start!100648 tp_is_empty!30439))

(declare-fun array_inv!28638 (array!77695) Bool)

(assert (=> start!100648 (array_inv!28638 _keys!1208)))

(assert (=> start!100648 true))

(assert (=> start!100648 tp!90194))

(declare-fun array_inv!28639 (array!77693) Bool)

(assert (=> start!100648 (and (array_inv!28639 _values!996) e!681662)))

(declare-fun b!1199864 () Bool)

(assert (=> b!1199864 (= e!681667 tp_is_empty!30439)))

(declare-fun mapIsEmpty!47501 () Bool)

(assert (=> mapIsEmpty!47501 mapRes!47501))

(declare-fun b!1199865 () Bool)

(declare-fun e!681664 () Bool)

(assert (=> b!1199865 (= e!681664 true)))

(declare-fun zeroValue!944 () V!45713)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!544018 () array!77695)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun minValue!944 () V!45713)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19570 0))(
  ( (tuple2!19571 (_1!9796 (_ BitVec 64)) (_2!9796 V!45713)) )
))
(declare-datatypes ((List!26383 0))(
  ( (Nil!26380) (Cons!26379 (h!27597 tuple2!19570) (t!39090 List!26383)) )
))
(declare-datatypes ((ListLongMap!17547 0))(
  ( (ListLongMap!17548 (toList!8789 List!26383)) )
))
(declare-fun lt!544016 () ListLongMap!17547)

(declare-fun getCurrentListMapNoExtraKeys!5256 (array!77695 array!77693 (_ BitVec 32) (_ BitVec 32) V!45713 V!45713 (_ BitVec 32) Int) ListLongMap!17547)

(declare-fun dynLambda!3200 (Int (_ BitVec 64)) V!45713)

(assert (=> b!1199865 (= lt!544016 (getCurrentListMapNoExtraKeys!5256 lt!544018 (array!77694 (store (arr!37485 _values!996) i!673 (ValueCellFull!14510 (dynLambda!3200 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38022 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!544017 () ListLongMap!17547)

(assert (=> b!1199865 (= lt!544017 (getCurrentListMapNoExtraKeys!5256 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1199866 () Bool)

(declare-fun res!798213 () Bool)

(declare-fun e!681666 () Bool)

(assert (=> b!1199866 (=> (not res!798213) (not e!681666))))

(declare-datatypes ((List!26384 0))(
  ( (Nil!26381) (Cons!26380 (h!27598 (_ BitVec 64)) (t!39091 List!26384)) )
))
(declare-fun arrayNoDuplicates!0 (array!77695 (_ BitVec 32) List!26384) Bool)

(assert (=> b!1199866 (= res!798213 (arrayNoDuplicates!0 lt!544018 #b00000000000000000000000000000000 Nil!26381))))

(declare-fun b!1199867 () Bool)

(declare-fun res!798214 () Bool)

(assert (=> b!1199867 (=> (not res!798214) (not e!681665))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1199867 (= res!798214 (validKeyInArray!0 k0!934))))

(declare-fun b!1199868 () Bool)

(declare-fun res!798217 () Bool)

(assert (=> b!1199868 (=> (not res!798217) (not e!681665))))

(assert (=> b!1199868 (= res!798217 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38023 _keys!1208))))))

(declare-fun b!1199869 () Bool)

(declare-fun res!798220 () Bool)

(assert (=> b!1199869 (=> (not res!798220) (not e!681665))))

(assert (=> b!1199869 (= res!798220 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26381))))

(declare-fun b!1199870 () Bool)

(assert (=> b!1199870 (= e!681666 (not e!681664))))

(declare-fun res!798218 () Bool)

(assert (=> b!1199870 (=> res!798218 e!681664)))

(assert (=> b!1199870 (= res!798218 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77695 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1199870 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39703 0))(
  ( (Unit!39704) )
))
(declare-fun lt!544019 () Unit!39703)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77695 (_ BitVec 64) (_ BitVec 32)) Unit!39703)

(assert (=> b!1199870 (= lt!544019 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1199871 () Bool)

(declare-fun res!798216 () Bool)

(assert (=> b!1199871 (=> (not res!798216) (not e!681665))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77695 (_ BitVec 32)) Bool)

(assert (=> b!1199871 (= res!798216 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1199872 () Bool)

(declare-fun res!798223 () Bool)

(assert (=> b!1199872 (=> (not res!798223) (not e!681665))))

(assert (=> b!1199872 (= res!798223 (and (= (size!38022 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38023 _keys!1208) (size!38022 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1199873 () Bool)

(declare-fun res!798219 () Bool)

(assert (=> b!1199873 (=> (not res!798219) (not e!681665))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1199873 (= res!798219 (validMask!0 mask!1564))))

(declare-fun b!1199874 () Bool)

(assert (=> b!1199874 (= e!681665 e!681666)))

(declare-fun res!798222 () Bool)

(assert (=> b!1199874 (=> (not res!798222) (not e!681666))))

(assert (=> b!1199874 (= res!798222 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!544018 mask!1564))))

(assert (=> b!1199874 (= lt!544018 (array!77696 (store (arr!37486 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38023 _keys!1208)))))

(assert (= (and start!100648 res!798221) b!1199873))

(assert (= (and b!1199873 res!798219) b!1199872))

(assert (= (and b!1199872 res!798223) b!1199871))

(assert (= (and b!1199871 res!798216) b!1199869))

(assert (= (and b!1199869 res!798220) b!1199868))

(assert (= (and b!1199868 res!798217) b!1199867))

(assert (= (and b!1199867 res!798214) b!1199863))

(assert (= (and b!1199863 res!798215) b!1199874))

(assert (= (and b!1199874 res!798222) b!1199866))

(assert (= (and b!1199866 res!798213) b!1199870))

(assert (= (and b!1199870 (not res!798218)) b!1199865))

(assert (= (and b!1199862 condMapEmpty!47501) mapIsEmpty!47501))

(assert (= (and b!1199862 (not condMapEmpty!47501)) mapNonEmpty!47501))

(get-info :version)

(assert (= (and mapNonEmpty!47501 ((_ is ValueCellFull!14510) mapValue!47501)) b!1199861))

(assert (= (and b!1199862 ((_ is ValueCellFull!14510) mapDefault!47501)) b!1199864))

(assert (= start!100648 b!1199862))

(declare-fun b_lambda!20925 () Bool)

(assert (=> (not b_lambda!20925) (not b!1199865)))

(declare-fun t!39089 () Bool)

(declare-fun tb!10527 () Bool)

(assert (=> (and start!100648 (= defaultEntry!1004 defaultEntry!1004) t!39089) tb!10527))

(declare-fun result!21639 () Bool)

(assert (=> tb!10527 (= result!21639 tp_is_empty!30439)))

(assert (=> b!1199865 t!39089))

(declare-fun b_and!42361 () Bool)

(assert (= b_and!42359 (and (=> t!39089 result!21639) b_and!42361)))

(declare-fun m!1106879 () Bool)

(assert (=> b!1199863 m!1106879))

(declare-fun m!1106881 () Bool)

(assert (=> b!1199870 m!1106881))

(declare-fun m!1106883 () Bool)

(assert (=> b!1199870 m!1106883))

(declare-fun m!1106885 () Bool)

(assert (=> b!1199874 m!1106885))

(declare-fun m!1106887 () Bool)

(assert (=> b!1199874 m!1106887))

(declare-fun m!1106889 () Bool)

(assert (=> mapNonEmpty!47501 m!1106889))

(declare-fun m!1106891 () Bool)

(assert (=> b!1199873 m!1106891))

(declare-fun m!1106893 () Bool)

(assert (=> b!1199871 m!1106893))

(declare-fun m!1106895 () Bool)

(assert (=> b!1199866 m!1106895))

(declare-fun m!1106897 () Bool)

(assert (=> b!1199869 m!1106897))

(declare-fun m!1106899 () Bool)

(assert (=> b!1199865 m!1106899))

(declare-fun m!1106901 () Bool)

(assert (=> b!1199865 m!1106901))

(declare-fun m!1106903 () Bool)

(assert (=> b!1199865 m!1106903))

(declare-fun m!1106905 () Bool)

(assert (=> b!1199865 m!1106905))

(declare-fun m!1106907 () Bool)

(assert (=> start!100648 m!1106907))

(declare-fun m!1106909 () Bool)

(assert (=> start!100648 m!1106909))

(declare-fun m!1106911 () Bool)

(assert (=> b!1199867 m!1106911))

(check-sat (not b!1199867) tp_is_empty!30439 (not b!1199873) (not b!1199869) b_and!42361 (not b!1199866) (not b!1199874) (not start!100648) (not b_lambda!20925) (not b_next!25735) (not mapNonEmpty!47501) (not b!1199871) (not b!1199870) (not b!1199865))
(check-sat b_and!42361 (not b_next!25735))
