; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100696 () Bool)

(assert start!100696)

(declare-fun b_free!25783 () Bool)

(declare-fun b_next!25783 () Bool)

(assert (=> start!100696 (= b_free!25783 (not b_next!25783))))

(declare-fun tp!90338 () Bool)

(declare-fun b_and!42455 () Bool)

(assert (=> start!100696 (= tp!90338 b_and!42455)))

(declare-fun b!1200917 () Bool)

(declare-fun res!799010 () Bool)

(declare-fun e!682171 () Bool)

(assert (=> b!1200917 (=> (not res!799010) (not e!682171))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!77789 0))(
  ( (array!77790 (arr!37533 (Array (_ BitVec 32) (_ BitVec 64))) (size!38070 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77789)

(assert (=> b!1200917 (= res!799010 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38070 _keys!1208))))))

(declare-fun b!1200918 () Bool)

(declare-fun res!799014 () Bool)

(assert (=> b!1200918 (=> (not res!799014) (not e!682171))))

(declare-datatypes ((List!26421 0))(
  ( (Nil!26418) (Cons!26417 (h!27635 (_ BitVec 64)) (t!39176 List!26421)) )
))
(declare-fun arrayNoDuplicates!0 (array!77789 (_ BitVec 32) List!26421) Bool)

(assert (=> b!1200918 (= res!799014 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26418))))

(declare-fun b!1200919 () Bool)

(declare-fun e!682166 () Bool)

(declare-fun e!682167 () Bool)

(declare-fun mapRes!47573 () Bool)

(assert (=> b!1200919 (= e!682166 (and e!682167 mapRes!47573))))

(declare-fun condMapEmpty!47573 () Bool)

(declare-datatypes ((V!45777 0))(
  ( (V!45778 (val!15300 Int)) )
))
(declare-datatypes ((ValueCell!14534 0))(
  ( (ValueCellFull!14534 (v!17934 V!45777)) (EmptyCell!14534) )
))
(declare-datatypes ((array!77791 0))(
  ( (array!77792 (arr!37534 (Array (_ BitVec 32) ValueCell!14534)) (size!38071 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77791)

(declare-fun mapDefault!47573 () ValueCell!14534)

(assert (=> b!1200919 (= condMapEmpty!47573 (= (arr!37534 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14534)) mapDefault!47573)))))

(declare-fun b!1200920 () Bool)

(declare-fun e!682170 () Bool)

(declare-fun e!682168 () Bool)

(assert (=> b!1200920 (= e!682170 (not e!682168))))

(declare-fun res!799006 () Bool)

(assert (=> b!1200920 (=> res!799006 e!682168)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1200920 (= res!799006 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77789 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1200920 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39743 0))(
  ( (Unit!39744) )
))
(declare-fun lt!544306 () Unit!39743)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77789 (_ BitVec 64) (_ BitVec 32)) Unit!39743)

(assert (=> b!1200920 (= lt!544306 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!47573 () Bool)

(declare-fun tp!90339 () Bool)

(declare-fun e!682172 () Bool)

(assert (=> mapNonEmpty!47573 (= mapRes!47573 (and tp!90339 e!682172))))

(declare-fun mapRest!47573 () (Array (_ BitVec 32) ValueCell!14534))

(declare-fun mapValue!47573 () ValueCell!14534)

(declare-fun mapKey!47573 () (_ BitVec 32))

(assert (=> mapNonEmpty!47573 (= (arr!37534 _values!996) (store mapRest!47573 mapKey!47573 mapValue!47573))))

(declare-fun b!1200921 () Bool)

(declare-fun res!799005 () Bool)

(assert (=> b!1200921 (=> (not res!799005) (not e!682171))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77789 (_ BitVec 32)) Bool)

(assert (=> b!1200921 (= res!799005 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1200922 () Bool)

(assert (=> b!1200922 (= e!682168 true)))

(declare-fun zeroValue!944 () V!45777)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!544307 () array!77789)

(declare-datatypes ((tuple2!19602 0))(
  ( (tuple2!19603 (_1!9812 (_ BitVec 64)) (_2!9812 V!45777)) )
))
(declare-datatypes ((List!26422 0))(
  ( (Nil!26419) (Cons!26418 (h!27636 tuple2!19602) (t!39177 List!26422)) )
))
(declare-datatypes ((ListLongMap!17579 0))(
  ( (ListLongMap!17580 (toList!8805 List!26422)) )
))
(declare-fun lt!544304 () ListLongMap!17579)

(declare-fun minValue!944 () V!45777)

(declare-fun getCurrentListMapNoExtraKeys!5272 (array!77789 array!77791 (_ BitVec 32) (_ BitVec 32) V!45777 V!45777 (_ BitVec 32) Int) ListLongMap!17579)

(declare-fun dynLambda!3216 (Int (_ BitVec 64)) V!45777)

(assert (=> b!1200922 (= lt!544304 (getCurrentListMapNoExtraKeys!5272 lt!544307 (array!77792 (store (arr!37534 _values!996) i!673 (ValueCellFull!14534 (dynLambda!3216 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38071 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!544305 () ListLongMap!17579)

(assert (=> b!1200922 (= lt!544305 (getCurrentListMapNoExtraKeys!5272 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1200923 () Bool)

(assert (=> b!1200923 (= e!682171 e!682170)))

(declare-fun res!799009 () Bool)

(assert (=> b!1200923 (=> (not res!799009) (not e!682170))))

(assert (=> b!1200923 (= res!799009 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!544307 mask!1564))))

(assert (=> b!1200923 (= lt!544307 (array!77790 (store (arr!37533 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38070 _keys!1208)))))

(declare-fun b!1200924 () Bool)

(declare-fun tp_is_empty!30487 () Bool)

(assert (=> b!1200924 (= e!682172 tp_is_empty!30487)))

(declare-fun b!1200925 () Bool)

(declare-fun res!799013 () Bool)

(assert (=> b!1200925 (=> (not res!799013) (not e!682171))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1200925 (= res!799013 (validKeyInArray!0 k0!934))))

(declare-fun b!1200926 () Bool)

(assert (=> b!1200926 (= e!682167 tp_is_empty!30487)))

(declare-fun b!1200927 () Bool)

(declare-fun res!799011 () Bool)

(assert (=> b!1200927 (=> (not res!799011) (not e!682171))))

(assert (=> b!1200927 (= res!799011 (and (= (size!38071 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38070 _keys!1208) (size!38071 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1200928 () Bool)

(declare-fun res!799007 () Bool)

(assert (=> b!1200928 (=> (not res!799007) (not e!682171))))

(assert (=> b!1200928 (= res!799007 (= (select (arr!37533 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!47573 () Bool)

(assert (=> mapIsEmpty!47573 mapRes!47573))

(declare-fun res!799008 () Bool)

(assert (=> start!100696 (=> (not res!799008) (not e!682171))))

(assert (=> start!100696 (= res!799008 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38070 _keys!1208))))))

(assert (=> start!100696 e!682171))

(assert (=> start!100696 tp_is_empty!30487))

(declare-fun array_inv!28672 (array!77789) Bool)

(assert (=> start!100696 (array_inv!28672 _keys!1208)))

(assert (=> start!100696 true))

(assert (=> start!100696 tp!90338))

(declare-fun array_inv!28673 (array!77791) Bool)

(assert (=> start!100696 (and (array_inv!28673 _values!996) e!682166)))

(declare-fun b!1200929 () Bool)

(declare-fun res!799012 () Bool)

(assert (=> b!1200929 (=> (not res!799012) (not e!682170))))

(assert (=> b!1200929 (= res!799012 (arrayNoDuplicates!0 lt!544307 #b00000000000000000000000000000000 Nil!26418))))

(declare-fun b!1200930 () Bool)

(declare-fun res!799015 () Bool)

(assert (=> b!1200930 (=> (not res!799015) (not e!682171))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1200930 (= res!799015 (validMask!0 mask!1564))))

(assert (= (and start!100696 res!799008) b!1200930))

(assert (= (and b!1200930 res!799015) b!1200927))

(assert (= (and b!1200927 res!799011) b!1200921))

(assert (= (and b!1200921 res!799005) b!1200918))

(assert (= (and b!1200918 res!799014) b!1200917))

(assert (= (and b!1200917 res!799010) b!1200925))

(assert (= (and b!1200925 res!799013) b!1200928))

(assert (= (and b!1200928 res!799007) b!1200923))

(assert (= (and b!1200923 res!799009) b!1200929))

(assert (= (and b!1200929 res!799012) b!1200920))

(assert (= (and b!1200920 (not res!799006)) b!1200922))

(assert (= (and b!1200919 condMapEmpty!47573) mapIsEmpty!47573))

(assert (= (and b!1200919 (not condMapEmpty!47573)) mapNonEmpty!47573))

(get-info :version)

(assert (= (and mapNonEmpty!47573 ((_ is ValueCellFull!14534) mapValue!47573)) b!1200924))

(assert (= (and b!1200919 ((_ is ValueCellFull!14534) mapDefault!47573)) b!1200926))

(assert (= start!100696 b!1200919))

(declare-fun b_lambda!20973 () Bool)

(assert (=> (not b_lambda!20973) (not b!1200922)))

(declare-fun t!39175 () Bool)

(declare-fun tb!10575 () Bool)

(assert (=> (and start!100696 (= defaultEntry!1004 defaultEntry!1004) t!39175) tb!10575))

(declare-fun result!21735 () Bool)

(assert (=> tb!10575 (= result!21735 tp_is_empty!30487)))

(assert (=> b!1200922 t!39175))

(declare-fun b_and!42457 () Bool)

(assert (= b_and!42455 (and (=> t!39175 result!21735) b_and!42457)))

(declare-fun m!1107695 () Bool)

(assert (=> start!100696 m!1107695))

(declare-fun m!1107697 () Bool)

(assert (=> start!100696 m!1107697))

(declare-fun m!1107699 () Bool)

(assert (=> b!1200918 m!1107699))

(declare-fun m!1107701 () Bool)

(assert (=> b!1200925 m!1107701))

(declare-fun m!1107703 () Bool)

(assert (=> b!1200929 m!1107703))

(declare-fun m!1107705 () Bool)

(assert (=> b!1200922 m!1107705))

(declare-fun m!1107707 () Bool)

(assert (=> b!1200922 m!1107707))

(declare-fun m!1107709 () Bool)

(assert (=> b!1200922 m!1107709))

(declare-fun m!1107711 () Bool)

(assert (=> b!1200922 m!1107711))

(declare-fun m!1107713 () Bool)

(assert (=> b!1200930 m!1107713))

(declare-fun m!1107715 () Bool)

(assert (=> b!1200921 m!1107715))

(declare-fun m!1107717 () Bool)

(assert (=> mapNonEmpty!47573 m!1107717))

(declare-fun m!1107719 () Bool)

(assert (=> b!1200923 m!1107719))

(declare-fun m!1107721 () Bool)

(assert (=> b!1200923 m!1107721))

(declare-fun m!1107723 () Bool)

(assert (=> b!1200920 m!1107723))

(declare-fun m!1107725 () Bool)

(assert (=> b!1200920 m!1107725))

(declare-fun m!1107727 () Bool)

(assert (=> b!1200928 m!1107727))

(check-sat (not b!1200923) (not b!1200930) (not start!100696) (not b_lambda!20973) (not b!1200922) (not mapNonEmpty!47573) b_and!42457 (not b!1200925) tp_is_empty!30487 (not b!1200921) (not b!1200920) (not b!1200929) (not b!1200918) (not b_next!25783))
(check-sat b_and!42457 (not b_next!25783))
