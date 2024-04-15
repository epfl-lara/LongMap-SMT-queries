; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100424 () Bool)

(assert start!100424)

(declare-fun b_free!25753 () Bool)

(declare-fun b_next!25753 () Bool)

(assert (=> start!100424 (= b_free!25753 (not b_next!25753))))

(declare-fun tp!90249 () Bool)

(declare-fun b_and!42371 () Bool)

(assert (=> start!100424 (= tp!90249 b_and!42371)))

(declare-fun b!1198844 () Bool)

(declare-fun e!680943 () Bool)

(declare-fun tp_is_empty!30457 () Bool)

(assert (=> b!1198844 (= e!680943 tp_is_empty!30457)))

(declare-fun b!1198845 () Bool)

(declare-fun e!680942 () Bool)

(assert (=> b!1198845 (= e!680942 true)))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((V!45737 0))(
  ( (V!45738 (val!15285 Int)) )
))
(declare-datatypes ((ValueCell!14519 0))(
  ( (ValueCellFull!14519 (v!17922 V!45737)) (EmptyCell!14519) )
))
(declare-datatypes ((array!77618 0))(
  ( (array!77619 (arr!37454 (Array (_ BitVec 32) ValueCell!14519)) (size!37992 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77618)

(declare-fun minValue!944 () V!45737)

(declare-fun zeroValue!944 () V!45737)

(declare-datatypes ((array!77620 0))(
  ( (array!77621 (arr!37455 (Array (_ BitVec 32) (_ BitVec 64))) (size!37993 (_ BitVec 32))) )
))
(declare-fun lt!543451 () array!77620)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!19652 0))(
  ( (tuple2!19653 (_1!9837 (_ BitVec 64)) (_2!9837 V!45737)) )
))
(declare-datatypes ((List!26440 0))(
  ( (Nil!26437) (Cons!26436 (h!27645 tuple2!19652) (t!39164 List!26440)) )
))
(declare-datatypes ((ListLongMap!17621 0))(
  ( (ListLongMap!17622 (toList!8826 List!26440)) )
))
(declare-fun lt!543450 () ListLongMap!17621)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5275 (array!77620 array!77618 (_ BitVec 32) (_ BitVec 32) V!45737 V!45737 (_ BitVec 32) Int) ListLongMap!17621)

(declare-fun dynLambda!3155 (Int (_ BitVec 64)) V!45737)

(assert (=> b!1198845 (= lt!543450 (getCurrentListMapNoExtraKeys!5275 lt!543451 (array!77619 (store (arr!37454 _values!996) i!673 (ValueCellFull!14519 (dynLambda!3155 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37992 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _keys!1208 () array!77620)

(declare-fun lt!543448 () ListLongMap!17621)

(assert (=> b!1198845 (= lt!543448 (getCurrentListMapNoExtraKeys!5275 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1198846 () Bool)

(declare-fun res!797937 () Bool)

(declare-fun e!680946 () Bool)

(assert (=> b!1198846 (=> (not res!797937) (not e!680946))))

(assert (=> b!1198846 (= res!797937 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37993 _keys!1208))))))

(declare-fun b!1198847 () Bool)

(declare-fun e!680947 () Bool)

(declare-fun e!680944 () Bool)

(declare-fun mapRes!47528 () Bool)

(assert (=> b!1198847 (= e!680947 (and e!680944 mapRes!47528))))

(declare-fun condMapEmpty!47528 () Bool)

(declare-fun mapDefault!47528 () ValueCell!14519)

(assert (=> b!1198847 (= condMapEmpty!47528 (= (arr!37454 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14519)) mapDefault!47528)))))

(declare-fun b!1198848 () Bool)

(declare-fun res!797946 () Bool)

(assert (=> b!1198848 (=> (not res!797946) (not e!680946))))

(assert (=> b!1198848 (= res!797946 (and (= (size!37992 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37993 _keys!1208) (size!37992 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1198849 () Bool)

(declare-fun e!680941 () Bool)

(assert (=> b!1198849 (= e!680946 e!680941)))

(declare-fun res!797936 () Bool)

(assert (=> b!1198849 (=> (not res!797936) (not e!680941))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77620 (_ BitVec 32)) Bool)

(assert (=> b!1198849 (= res!797936 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543451 mask!1564))))

(assert (=> b!1198849 (= lt!543451 (array!77621 (store (arr!37455 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37993 _keys!1208)))))

(declare-fun mapNonEmpty!47528 () Bool)

(declare-fun tp!90248 () Bool)

(assert (=> mapNonEmpty!47528 (= mapRes!47528 (and tp!90248 e!680943))))

(declare-fun mapRest!47528 () (Array (_ BitVec 32) ValueCell!14519))

(declare-fun mapValue!47528 () ValueCell!14519)

(declare-fun mapKey!47528 () (_ BitVec 32))

(assert (=> mapNonEmpty!47528 (= (arr!37454 _values!996) (store mapRest!47528 mapKey!47528 mapValue!47528))))

(declare-fun b!1198850 () Bool)

(declare-fun res!797941 () Bool)

(assert (=> b!1198850 (=> (not res!797941) (not e!680946))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1198850 (= res!797941 (validMask!0 mask!1564))))

(declare-fun b!1198851 () Bool)

(declare-fun res!797940 () Bool)

(assert (=> b!1198851 (=> (not res!797940) (not e!680946))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1198851 (= res!797940 (validKeyInArray!0 k0!934))))

(declare-fun b!1198852 () Bool)

(declare-fun res!797943 () Bool)

(assert (=> b!1198852 (=> (not res!797943) (not e!680941))))

(declare-datatypes ((List!26441 0))(
  ( (Nil!26438) (Cons!26437 (h!27646 (_ BitVec 64)) (t!39165 List!26441)) )
))
(declare-fun arrayNoDuplicates!0 (array!77620 (_ BitVec 32) List!26441) Bool)

(assert (=> b!1198852 (= res!797943 (arrayNoDuplicates!0 lt!543451 #b00000000000000000000000000000000 Nil!26438))))

(declare-fun b!1198853 () Bool)

(assert (=> b!1198853 (= e!680941 (not e!680942))))

(declare-fun res!797939 () Bool)

(assert (=> b!1198853 (=> res!797939 e!680942)))

(assert (=> b!1198853 (= res!797939 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77620 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1198853 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39613 0))(
  ( (Unit!39614) )
))
(declare-fun lt!543449 () Unit!39613)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77620 (_ BitVec 64) (_ BitVec 32)) Unit!39613)

(assert (=> b!1198853 (= lt!543449 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1198854 () Bool)

(declare-fun res!797938 () Bool)

(assert (=> b!1198854 (=> (not res!797938) (not e!680946))))

(assert (=> b!1198854 (= res!797938 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26438))))

(declare-fun res!797944 () Bool)

(assert (=> start!100424 (=> (not res!797944) (not e!680946))))

(assert (=> start!100424 (= res!797944 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37993 _keys!1208))))))

(assert (=> start!100424 e!680946))

(assert (=> start!100424 tp_is_empty!30457))

(declare-fun array_inv!28662 (array!77620) Bool)

(assert (=> start!100424 (array_inv!28662 _keys!1208)))

(assert (=> start!100424 true))

(assert (=> start!100424 tp!90249))

(declare-fun array_inv!28663 (array!77618) Bool)

(assert (=> start!100424 (and (array_inv!28663 _values!996) e!680947)))

(declare-fun b!1198855 () Bool)

(assert (=> b!1198855 (= e!680944 tp_is_empty!30457)))

(declare-fun b!1198856 () Bool)

(declare-fun res!797942 () Bool)

(assert (=> b!1198856 (=> (not res!797942) (not e!680946))))

(assert (=> b!1198856 (= res!797942 (= (select (arr!37455 _keys!1208) i!673) k0!934))))

(declare-fun b!1198857 () Bool)

(declare-fun res!797945 () Bool)

(assert (=> b!1198857 (=> (not res!797945) (not e!680946))))

(assert (=> b!1198857 (= res!797945 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!47528 () Bool)

(assert (=> mapIsEmpty!47528 mapRes!47528))

(assert (= (and start!100424 res!797944) b!1198850))

(assert (= (and b!1198850 res!797941) b!1198848))

(assert (= (and b!1198848 res!797946) b!1198857))

(assert (= (and b!1198857 res!797945) b!1198854))

(assert (= (and b!1198854 res!797938) b!1198846))

(assert (= (and b!1198846 res!797937) b!1198851))

(assert (= (and b!1198851 res!797940) b!1198856))

(assert (= (and b!1198856 res!797942) b!1198849))

(assert (= (and b!1198849 res!797936) b!1198852))

(assert (= (and b!1198852 res!797943) b!1198853))

(assert (= (and b!1198853 (not res!797939)) b!1198845))

(assert (= (and b!1198847 condMapEmpty!47528) mapIsEmpty!47528))

(assert (= (and b!1198847 (not condMapEmpty!47528)) mapNonEmpty!47528))

(get-info :version)

(assert (= (and mapNonEmpty!47528 ((_ is ValueCellFull!14519) mapValue!47528)) b!1198844))

(assert (= (and b!1198847 ((_ is ValueCellFull!14519) mapDefault!47528)) b!1198855))

(assert (= start!100424 b!1198847))

(declare-fun b_lambda!20931 () Bool)

(assert (=> (not b_lambda!20931) (not b!1198845)))

(declare-fun t!39163 () Bool)

(declare-fun tb!10545 () Bool)

(assert (=> (and start!100424 (= defaultEntry!1004 defaultEntry!1004) t!39163) tb!10545))

(declare-fun result!21675 () Bool)

(assert (=> tb!10545 (= result!21675 tp_is_empty!30457)))

(assert (=> b!1198845 t!39163))

(declare-fun b_and!42373 () Bool)

(assert (= b_and!42371 (and (=> t!39163 result!21675) b_and!42373)))

(declare-fun m!1105003 () Bool)

(assert (=> b!1198845 m!1105003))

(declare-fun m!1105005 () Bool)

(assert (=> b!1198845 m!1105005))

(declare-fun m!1105007 () Bool)

(assert (=> b!1198845 m!1105007))

(declare-fun m!1105009 () Bool)

(assert (=> b!1198845 m!1105009))

(declare-fun m!1105011 () Bool)

(assert (=> b!1198857 m!1105011))

(declare-fun m!1105013 () Bool)

(assert (=> b!1198856 m!1105013))

(declare-fun m!1105015 () Bool)

(assert (=> start!100424 m!1105015))

(declare-fun m!1105017 () Bool)

(assert (=> start!100424 m!1105017))

(declare-fun m!1105019 () Bool)

(assert (=> b!1198851 m!1105019))

(declare-fun m!1105021 () Bool)

(assert (=> mapNonEmpty!47528 m!1105021))

(declare-fun m!1105023 () Bool)

(assert (=> b!1198853 m!1105023))

(declare-fun m!1105025 () Bool)

(assert (=> b!1198853 m!1105025))

(declare-fun m!1105027 () Bool)

(assert (=> b!1198852 m!1105027))

(declare-fun m!1105029 () Bool)

(assert (=> b!1198854 m!1105029))

(declare-fun m!1105031 () Bool)

(assert (=> b!1198850 m!1105031))

(declare-fun m!1105033 () Bool)

(assert (=> b!1198849 m!1105033))

(declare-fun m!1105035 () Bool)

(assert (=> b!1198849 m!1105035))

(check-sat (not b!1198845) (not b_next!25753) (not b!1198849) tp_is_empty!30457 (not b_lambda!20931) (not b!1198857) (not mapNonEmpty!47528) (not b!1198853) (not b!1198851) (not b!1198850) (not b!1198854) (not b!1198852) b_and!42373 (not start!100424))
(check-sat b_and!42373 (not b_next!25753))
