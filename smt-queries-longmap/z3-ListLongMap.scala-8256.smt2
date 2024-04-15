; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100478 () Bool)

(assert start!100478)

(declare-fun b_free!25807 () Bool)

(declare-fun b_next!25807 () Bool)

(assert (=> start!100478 (= b_free!25807 (not b_next!25807))))

(declare-fun tp!90410 () Bool)

(declare-fun b_and!42479 () Bool)

(assert (=> start!100478 (= tp!90410 b_and!42479)))

(declare-fun b!1200032 () Bool)

(declare-fun e!681513 () Bool)

(declare-fun tp_is_empty!30511 () Bool)

(assert (=> b!1200032 (= e!681513 tp_is_empty!30511)))

(declare-fun b!1200033 () Bool)

(declare-fun e!681510 () Bool)

(assert (=> b!1200033 (= e!681510 tp_is_empty!30511)))

(declare-fun b!1200034 () Bool)

(declare-fun e!681514 () Bool)

(declare-fun mapRes!47609 () Bool)

(assert (=> b!1200034 (= e!681514 (and e!681510 mapRes!47609))))

(declare-fun condMapEmpty!47609 () Bool)

(declare-datatypes ((V!45809 0))(
  ( (V!45810 (val!15312 Int)) )
))
(declare-datatypes ((ValueCell!14546 0))(
  ( (ValueCellFull!14546 (v!17949 V!45809)) (EmptyCell!14546) )
))
(declare-datatypes ((array!77720 0))(
  ( (array!77721 (arr!37505 (Array (_ BitVec 32) ValueCell!14546)) (size!38043 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77720)

(declare-fun mapDefault!47609 () ValueCell!14546)

(assert (=> b!1200034 (= condMapEmpty!47609 (= (arr!37505 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14546)) mapDefault!47609)))))

(declare-fun b!1200035 () Bool)

(declare-fun res!798835 () Bool)

(declare-fun e!681508 () Bool)

(assert (=> b!1200035 (=> (not res!798835) (not e!681508))))

(declare-datatypes ((array!77722 0))(
  ( (array!77723 (arr!37506 (Array (_ BitVec 32) (_ BitVec 64))) (size!38044 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77722)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1200035 (= res!798835 (and (= (size!38043 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38044 _keys!1208) (size!38043 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1200036 () Bool)

(declare-fun res!798830 () Bool)

(declare-fun e!681512 () Bool)

(assert (=> b!1200036 (=> (not res!798830) (not e!681512))))

(declare-fun lt!543774 () array!77722)

(declare-datatypes ((List!26478 0))(
  ( (Nil!26475) (Cons!26474 (h!27683 (_ BitVec 64)) (t!39256 List!26478)) )
))
(declare-fun arrayNoDuplicates!0 (array!77722 (_ BitVec 32) List!26478) Bool)

(assert (=> b!1200036 (= res!798830 (arrayNoDuplicates!0 lt!543774 #b00000000000000000000000000000000 Nil!26475))))

(declare-fun b!1200037 () Bool)

(declare-fun res!798827 () Bool)

(assert (=> b!1200037 (=> (not res!798827) (not e!681508))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1200037 (= res!798827 (validMask!0 mask!1564))))

(declare-fun b!1200038 () Bool)

(assert (=> b!1200038 (= e!681508 e!681512)))

(declare-fun res!798828 () Bool)

(assert (=> b!1200038 (=> (not res!798828) (not e!681512))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77722 (_ BitVec 32)) Bool)

(assert (=> b!1200038 (= res!798828 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543774 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1200038 (= lt!543774 (array!77723 (store (arr!37506 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38044 _keys!1208)))))

(declare-fun b!1200039 () Bool)

(declare-fun res!798836 () Bool)

(assert (=> b!1200039 (=> (not res!798836) (not e!681508))))

(assert (=> b!1200039 (= res!798836 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38044 _keys!1208))))))

(declare-fun b!1200040 () Bool)

(declare-fun e!681509 () Bool)

(assert (=> b!1200040 (= e!681512 (not e!681509))))

(declare-fun res!798837 () Bool)

(assert (=> b!1200040 (=> res!798837 e!681509)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1200040 (= res!798837 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77722 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1200040 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39647 0))(
  ( (Unit!39648) )
))
(declare-fun lt!543775 () Unit!39647)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77722 (_ BitVec 64) (_ BitVec 32)) Unit!39647)

(assert (=> b!1200040 (= lt!543775 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1200041 () Bool)

(declare-fun res!798833 () Bool)

(assert (=> b!1200041 (=> (not res!798833) (not e!681508))))

(assert (=> b!1200041 (= res!798833 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26475))))

(declare-fun b!1200042 () Bool)

(declare-fun res!798829 () Bool)

(assert (=> b!1200042 (=> (not res!798829) (not e!681508))))

(assert (=> b!1200042 (= res!798829 (= (select (arr!37506 _keys!1208) i!673) k0!934))))

(declare-fun b!1200043 () Bool)

(declare-fun res!798832 () Bool)

(assert (=> b!1200043 (=> (not res!798832) (not e!681508))))

(assert (=> b!1200043 (= res!798832 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1200044 () Bool)

(declare-fun res!798831 () Bool)

(assert (=> b!1200044 (=> (not res!798831) (not e!681508))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1200044 (= res!798831 (validKeyInArray!0 k0!934))))

(declare-fun b!1200045 () Bool)

(assert (=> b!1200045 (= e!681509 true)))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19688 0))(
  ( (tuple2!19689 (_1!9855 (_ BitVec 64)) (_2!9855 V!45809)) )
))
(declare-datatypes ((List!26479 0))(
  ( (Nil!26476) (Cons!26475 (h!27684 tuple2!19688) (t!39257 List!26479)) )
))
(declare-datatypes ((ListLongMap!17657 0))(
  ( (ListLongMap!17658 (toList!8844 List!26479)) )
))
(declare-fun lt!543772 () ListLongMap!17657)

(declare-fun minValue!944 () V!45809)

(declare-fun zeroValue!944 () V!45809)

(declare-fun getCurrentListMapNoExtraKeys!5293 (array!77722 array!77720 (_ BitVec 32) (_ BitVec 32) V!45809 V!45809 (_ BitVec 32) Int) ListLongMap!17657)

(declare-fun dynLambda!3173 (Int (_ BitVec 64)) V!45809)

(assert (=> b!1200045 (= lt!543772 (getCurrentListMapNoExtraKeys!5293 lt!543774 (array!77721 (store (arr!37505 _values!996) i!673 (ValueCellFull!14546 (dynLambda!3173 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38043 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!543773 () ListLongMap!17657)

(assert (=> b!1200045 (= lt!543773 (getCurrentListMapNoExtraKeys!5293 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!798834 () Bool)

(assert (=> start!100478 (=> (not res!798834) (not e!681508))))

(assert (=> start!100478 (= res!798834 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38044 _keys!1208))))))

(assert (=> start!100478 e!681508))

(assert (=> start!100478 tp_is_empty!30511))

(declare-fun array_inv!28698 (array!77722) Bool)

(assert (=> start!100478 (array_inv!28698 _keys!1208)))

(assert (=> start!100478 true))

(assert (=> start!100478 tp!90410))

(declare-fun array_inv!28699 (array!77720) Bool)

(assert (=> start!100478 (and (array_inv!28699 _values!996) e!681514)))

(declare-fun mapIsEmpty!47609 () Bool)

(assert (=> mapIsEmpty!47609 mapRes!47609))

(declare-fun mapNonEmpty!47609 () Bool)

(declare-fun tp!90411 () Bool)

(assert (=> mapNonEmpty!47609 (= mapRes!47609 (and tp!90411 e!681513))))

(declare-fun mapValue!47609 () ValueCell!14546)

(declare-fun mapKey!47609 () (_ BitVec 32))

(declare-fun mapRest!47609 () (Array (_ BitVec 32) ValueCell!14546))

(assert (=> mapNonEmpty!47609 (= (arr!37505 _values!996) (store mapRest!47609 mapKey!47609 mapValue!47609))))

(assert (= (and start!100478 res!798834) b!1200037))

(assert (= (and b!1200037 res!798827) b!1200035))

(assert (= (and b!1200035 res!798835) b!1200043))

(assert (= (and b!1200043 res!798832) b!1200041))

(assert (= (and b!1200041 res!798833) b!1200039))

(assert (= (and b!1200039 res!798836) b!1200044))

(assert (= (and b!1200044 res!798831) b!1200042))

(assert (= (and b!1200042 res!798829) b!1200038))

(assert (= (and b!1200038 res!798828) b!1200036))

(assert (= (and b!1200036 res!798830) b!1200040))

(assert (= (and b!1200040 (not res!798837)) b!1200045))

(assert (= (and b!1200034 condMapEmpty!47609) mapIsEmpty!47609))

(assert (= (and b!1200034 (not condMapEmpty!47609)) mapNonEmpty!47609))

(get-info :version)

(assert (= (and mapNonEmpty!47609 ((_ is ValueCellFull!14546) mapValue!47609)) b!1200032))

(assert (= (and b!1200034 ((_ is ValueCellFull!14546) mapDefault!47609)) b!1200033))

(assert (= start!100478 b!1200034))

(declare-fun b_lambda!20985 () Bool)

(assert (=> (not b_lambda!20985) (not b!1200045)))

(declare-fun t!39255 () Bool)

(declare-fun tb!10599 () Bool)

(assert (=> (and start!100478 (= defaultEntry!1004 defaultEntry!1004) t!39255) tb!10599))

(declare-fun result!21783 () Bool)

(assert (=> tb!10599 (= result!21783 tp_is_empty!30511)))

(assert (=> b!1200045 t!39255))

(declare-fun b_and!42481 () Bool)

(assert (= b_and!42479 (and (=> t!39255 result!21783) b_and!42481)))

(declare-fun m!1105921 () Bool)

(assert (=> b!1200038 m!1105921))

(declare-fun m!1105923 () Bool)

(assert (=> b!1200038 m!1105923))

(declare-fun m!1105925 () Bool)

(assert (=> mapNonEmpty!47609 m!1105925))

(declare-fun m!1105927 () Bool)

(assert (=> b!1200037 m!1105927))

(declare-fun m!1105929 () Bool)

(assert (=> start!100478 m!1105929))

(declare-fun m!1105931 () Bool)

(assert (=> start!100478 m!1105931))

(declare-fun m!1105933 () Bool)

(assert (=> b!1200043 m!1105933))

(declare-fun m!1105935 () Bool)

(assert (=> b!1200045 m!1105935))

(declare-fun m!1105937 () Bool)

(assert (=> b!1200045 m!1105937))

(declare-fun m!1105939 () Bool)

(assert (=> b!1200045 m!1105939))

(declare-fun m!1105941 () Bool)

(assert (=> b!1200045 m!1105941))

(declare-fun m!1105943 () Bool)

(assert (=> b!1200042 m!1105943))

(declare-fun m!1105945 () Bool)

(assert (=> b!1200040 m!1105945))

(declare-fun m!1105947 () Bool)

(assert (=> b!1200040 m!1105947))

(declare-fun m!1105949 () Bool)

(assert (=> b!1200044 m!1105949))

(declare-fun m!1105951 () Bool)

(assert (=> b!1200036 m!1105951))

(declare-fun m!1105953 () Bool)

(assert (=> b!1200041 m!1105953))

(check-sat (not b_next!25807) (not b!1200038) (not b!1200043) (not b!1200036) tp_is_empty!30511 (not b!1200037) (not b!1200041) b_and!42481 (not start!100478) (not b!1200044) (not b_lambda!20985) (not b!1200045) (not mapNonEmpty!47609) (not b!1200040))
(check-sat b_and!42481 (not b_next!25807))
