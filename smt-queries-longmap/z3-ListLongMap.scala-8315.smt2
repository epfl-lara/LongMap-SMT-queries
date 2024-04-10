; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101240 () Bool)

(assert start!101240)

(declare-fun b_free!26163 () Bool)

(declare-fun b_next!26163 () Bool)

(assert (=> start!101240 (= b_free!26163 (not b_next!26163))))

(declare-fun tp!91510 () Bool)

(declare-fun b_and!43443 () Bool)

(assert (=> start!101240 (= tp!91510 b_and!43443)))

(declare-fun mapIsEmpty!48175 () Bool)

(declare-fun mapRes!48175 () Bool)

(assert (=> mapIsEmpty!48175 mapRes!48175))

(declare-fun b!1215860 () Bool)

(declare-fun e!690344 () Bool)

(declare-fun e!690346 () Bool)

(assert (=> b!1215860 (= e!690344 (not e!690346))))

(declare-fun res!807329 () Bool)

(assert (=> b!1215860 (=> res!807329 e!690346)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1215860 (= res!807329 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!78507 0))(
  ( (array!78508 (arr!37888 (Array (_ BitVec 32) (_ BitVec 64))) (size!38424 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78507)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78507 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1215860 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40314 0))(
  ( (Unit!40315) )
))
(declare-fun lt!552729 () Unit!40314)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78507 (_ BitVec 64) (_ BitVec 32)) Unit!40314)

(assert (=> b!1215860 (= lt!552729 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!807328 () Bool)

(declare-fun e!690349 () Bool)

(assert (=> start!101240 (=> (not res!807328) (not e!690349))))

(assert (=> start!101240 (= res!807328 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38424 _keys!1208))))))

(assert (=> start!101240 e!690349))

(declare-fun tp_is_empty!30867 () Bool)

(assert (=> start!101240 tp_is_empty!30867))

(declare-fun array_inv!28848 (array!78507) Bool)

(assert (=> start!101240 (array_inv!28848 _keys!1208)))

(assert (=> start!101240 true))

(assert (=> start!101240 tp!91510))

(declare-datatypes ((V!46283 0))(
  ( (V!46284 (val!15490 Int)) )
))
(declare-datatypes ((ValueCell!14724 0))(
  ( (ValueCellFull!14724 (v!18143 V!46283)) (EmptyCell!14724) )
))
(declare-datatypes ((array!78509 0))(
  ( (array!78510 (arr!37889 (Array (_ BitVec 32) ValueCell!14724)) (size!38425 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78509)

(declare-fun e!690348 () Bool)

(declare-fun array_inv!28849 (array!78509) Bool)

(assert (=> start!101240 (and (array_inv!28849 _values!996) e!690348)))

(declare-fun b!1215861 () Bool)

(declare-fun res!807327 () Bool)

(assert (=> b!1215861 (=> (not res!807327) (not e!690349))))

(assert (=> b!1215861 (= res!807327 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38424 _keys!1208))))))

(declare-fun b!1215862 () Bool)

(declare-fun res!807325 () Bool)

(assert (=> b!1215862 (=> (not res!807325) (not e!690349))))

(declare-datatypes ((List!26710 0))(
  ( (Nil!26707) (Cons!26706 (h!27915 (_ BitVec 64)) (t!39853 List!26710)) )
))
(declare-fun arrayNoDuplicates!0 (array!78507 (_ BitVec 32) List!26710) Bool)

(assert (=> b!1215862 (= res!807325 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26707))))

(declare-fun b!1215863 () Bool)

(declare-fun res!807326 () Bool)

(assert (=> b!1215863 (=> (not res!807326) (not e!690349))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1215863 (= res!807326 (validKeyInArray!0 k0!934))))

(declare-fun b!1215864 () Bool)

(declare-fun res!807321 () Bool)

(assert (=> b!1215864 (=> (not res!807321) (not e!690349))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78507 (_ BitVec 32)) Bool)

(assert (=> b!1215864 (= res!807321 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1215865 () Bool)

(declare-fun res!807319 () Bool)

(assert (=> b!1215865 (=> (not res!807319) (not e!690344))))

(declare-fun lt!552730 () array!78507)

(assert (=> b!1215865 (= res!807319 (arrayNoDuplicates!0 lt!552730 #b00000000000000000000000000000000 Nil!26707))))

(declare-fun b!1215866 () Bool)

(declare-fun res!807323 () Bool)

(assert (=> b!1215866 (=> (not res!807323) (not e!690349))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1215866 (= res!807323 (validMask!0 mask!1564))))

(declare-fun b!1215867 () Bool)

(assert (=> b!1215867 (= e!690349 e!690344)))

(declare-fun res!807320 () Bool)

(assert (=> b!1215867 (=> (not res!807320) (not e!690344))))

(assert (=> b!1215867 (= res!807320 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552730 mask!1564))))

(assert (=> b!1215867 (= lt!552730 (array!78508 (store (arr!37888 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38424 _keys!1208)))))

(declare-fun b!1215868 () Bool)

(declare-fun e!690343 () Bool)

(assert (=> b!1215868 (= e!690343 tp_is_empty!30867)))

(declare-fun b!1215869 () Bool)

(assert (=> b!1215869 (= e!690346 true)))

(declare-fun zeroValue!944 () V!46283)

(declare-datatypes ((tuple2!19908 0))(
  ( (tuple2!19909 (_1!9965 (_ BitVec 64)) (_2!9965 V!46283)) )
))
(declare-datatypes ((List!26711 0))(
  ( (Nil!26708) (Cons!26707 (h!27916 tuple2!19908) (t!39854 List!26711)) )
))
(declare-datatypes ((ListLongMap!17877 0))(
  ( (ListLongMap!17878 (toList!8954 List!26711)) )
))
(declare-fun lt!552732 () ListLongMap!17877)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46283)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5381 (array!78507 array!78509 (_ BitVec 32) (_ BitVec 32) V!46283 V!46283 (_ BitVec 32) Int) ListLongMap!17877)

(declare-fun dynLambda!3270 (Int (_ BitVec 64)) V!46283)

(assert (=> b!1215869 (= lt!552732 (getCurrentListMapNoExtraKeys!5381 lt!552730 (array!78510 (store (arr!37889 _values!996) i!673 (ValueCellFull!14724 (dynLambda!3270 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38425 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!552731 () ListLongMap!17877)

(assert (=> b!1215869 (= lt!552731 (getCurrentListMapNoExtraKeys!5381 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1215870 () Bool)

(assert (=> b!1215870 (= e!690348 (and e!690343 mapRes!48175))))

(declare-fun condMapEmpty!48175 () Bool)

(declare-fun mapDefault!48175 () ValueCell!14724)

(assert (=> b!1215870 (= condMapEmpty!48175 (= (arr!37889 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14724)) mapDefault!48175)))))

(declare-fun b!1215871 () Bool)

(declare-fun res!807322 () Bool)

(assert (=> b!1215871 (=> (not res!807322) (not e!690349))))

(assert (=> b!1215871 (= res!807322 (= (select (arr!37888 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!48175 () Bool)

(declare-fun tp!91511 () Bool)

(declare-fun e!690347 () Bool)

(assert (=> mapNonEmpty!48175 (= mapRes!48175 (and tp!91511 e!690347))))

(declare-fun mapValue!48175 () ValueCell!14724)

(declare-fun mapRest!48175 () (Array (_ BitVec 32) ValueCell!14724))

(declare-fun mapKey!48175 () (_ BitVec 32))

(assert (=> mapNonEmpty!48175 (= (arr!37889 _values!996) (store mapRest!48175 mapKey!48175 mapValue!48175))))

(declare-fun b!1215872 () Bool)

(assert (=> b!1215872 (= e!690347 tp_is_empty!30867)))

(declare-fun b!1215873 () Bool)

(declare-fun res!807324 () Bool)

(assert (=> b!1215873 (=> (not res!807324) (not e!690349))))

(assert (=> b!1215873 (= res!807324 (and (= (size!38425 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38424 _keys!1208) (size!38425 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!101240 res!807328) b!1215866))

(assert (= (and b!1215866 res!807323) b!1215873))

(assert (= (and b!1215873 res!807324) b!1215864))

(assert (= (and b!1215864 res!807321) b!1215862))

(assert (= (and b!1215862 res!807325) b!1215861))

(assert (= (and b!1215861 res!807327) b!1215863))

(assert (= (and b!1215863 res!807326) b!1215871))

(assert (= (and b!1215871 res!807322) b!1215867))

(assert (= (and b!1215867 res!807320) b!1215865))

(assert (= (and b!1215865 res!807319) b!1215860))

(assert (= (and b!1215860 (not res!807329)) b!1215869))

(assert (= (and b!1215870 condMapEmpty!48175) mapIsEmpty!48175))

(assert (= (and b!1215870 (not condMapEmpty!48175)) mapNonEmpty!48175))

(get-info :version)

(assert (= (and mapNonEmpty!48175 ((_ is ValueCellFull!14724) mapValue!48175)) b!1215872))

(assert (= (and b!1215870 ((_ is ValueCellFull!14724) mapDefault!48175)) b!1215868))

(assert (= start!101240 b!1215870))

(declare-fun b_lambda!21839 () Bool)

(assert (=> (not b_lambda!21839) (not b!1215869)))

(declare-fun t!39852 () Bool)

(declare-fun tb!10963 () Bool)

(assert (=> (and start!101240 (= defaultEntry!1004 defaultEntry!1004) t!39852) tb!10963))

(declare-fun result!22523 () Bool)

(assert (=> tb!10963 (= result!22523 tp_is_empty!30867)))

(assert (=> b!1215869 t!39852))

(declare-fun b_and!43445 () Bool)

(assert (= b_and!43443 (and (=> t!39852 result!22523) b_and!43445)))

(declare-fun m!1120735 () Bool)

(assert (=> mapNonEmpty!48175 m!1120735))

(declare-fun m!1120737 () Bool)

(assert (=> b!1215860 m!1120737))

(declare-fun m!1120739 () Bool)

(assert (=> b!1215860 m!1120739))

(declare-fun m!1120741 () Bool)

(assert (=> b!1215869 m!1120741))

(declare-fun m!1120743 () Bool)

(assert (=> b!1215869 m!1120743))

(declare-fun m!1120745 () Bool)

(assert (=> b!1215869 m!1120745))

(declare-fun m!1120747 () Bool)

(assert (=> b!1215869 m!1120747))

(declare-fun m!1120749 () Bool)

(assert (=> b!1215871 m!1120749))

(declare-fun m!1120751 () Bool)

(assert (=> b!1215863 m!1120751))

(declare-fun m!1120753 () Bool)

(assert (=> start!101240 m!1120753))

(declare-fun m!1120755 () Bool)

(assert (=> start!101240 m!1120755))

(declare-fun m!1120757 () Bool)

(assert (=> b!1215862 m!1120757))

(declare-fun m!1120759 () Bool)

(assert (=> b!1215865 m!1120759))

(declare-fun m!1120761 () Bool)

(assert (=> b!1215867 m!1120761))

(declare-fun m!1120763 () Bool)

(assert (=> b!1215867 m!1120763))

(declare-fun m!1120765 () Bool)

(assert (=> b!1215866 m!1120765))

(declare-fun m!1120767 () Bool)

(assert (=> b!1215864 m!1120767))

(check-sat (not b_lambda!21839) (not b!1215865) (not b!1215863) b_and!43445 (not b!1215867) (not b!1215866) (not mapNonEmpty!48175) (not b!1215860) tp_is_empty!30867 (not start!101240) (not b!1215862) (not b!1215869) (not b!1215864) (not b_next!26163))
(check-sat b_and!43445 (not b_next!26163))
