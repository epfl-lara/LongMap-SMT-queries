; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101420 () Bool)

(assert start!101420)

(declare-fun b_free!26107 () Bool)

(declare-fun b_next!26107 () Bool)

(assert (=> start!101420 (= b_free!26107 (not b_next!26107))))

(declare-fun tp!91342 () Bool)

(declare-fun b_and!43333 () Bool)

(assert (=> start!101420 (= tp!91342 b_and!43333)))

(declare-fun mapNonEmpty!48091 () Bool)

(declare-fun mapRes!48091 () Bool)

(declare-fun tp!91343 () Bool)

(declare-fun e!690592 () Bool)

(assert (=> mapNonEmpty!48091 (= mapRes!48091 (and tp!91343 e!690592))))

(declare-datatypes ((V!46209 0))(
  ( (V!46210 (val!15462 Int)) )
))
(declare-datatypes ((ValueCell!14696 0))(
  ( (ValueCellFull!14696 (v!18111 V!46209)) (EmptyCell!14696) )
))
(declare-fun mapRest!48091 () (Array (_ BitVec 32) ValueCell!14696))

(declare-fun mapKey!48091 () (_ BitVec 32))

(declare-fun mapValue!48091 () ValueCell!14696)

(declare-datatypes ((array!78443 0))(
  ( (array!78444 (arr!37850 (Array (_ BitVec 32) ValueCell!14696)) (size!38387 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78443)

(assert (=> mapNonEmpty!48091 (= (arr!37850 _values!996) (store mapRest!48091 mapKey!48091 mapValue!48091))))

(declare-fun b!1215915 () Bool)

(declare-fun res!806901 () Bool)

(declare-fun e!690588 () Bool)

(assert (=> b!1215915 (=> (not res!806901) (not e!690588))))

(declare-datatypes ((array!78445 0))(
  ( (array!78446 (arr!37851 (Array (_ BitVec 32) (_ BitVec 64))) (size!38388 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78445)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1215915 (= res!806901 (= (select (arr!37851 _keys!1208) i!673) k0!934))))

(declare-fun b!1215916 () Bool)

(declare-fun tp_is_empty!30811 () Bool)

(assert (=> b!1215916 (= e!690592 tp_is_empty!30811)))

(declare-fun b!1215917 () Bool)

(declare-fun res!806911 () Bool)

(assert (=> b!1215917 (=> (not res!806911) (not e!690588))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1215917 (= res!806911 (validKeyInArray!0 k0!934))))

(declare-fun b!1215918 () Bool)

(declare-fun e!690591 () Bool)

(declare-fun e!690590 () Bool)

(assert (=> b!1215918 (= e!690591 (not e!690590))))

(declare-fun res!806902 () Bool)

(assert (=> b!1215918 (=> res!806902 e!690590)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1215918 (= res!806902 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78445 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1215918 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40252 0))(
  ( (Unit!40253) )
))
(declare-fun lt!552875 () Unit!40252)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78445 (_ BitVec 64) (_ BitVec 32)) Unit!40252)

(assert (=> b!1215918 (= lt!552875 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!806903 () Bool)

(assert (=> start!101420 (=> (not res!806903) (not e!690588))))

(assert (=> start!101420 (= res!806903 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38388 _keys!1208))))))

(assert (=> start!101420 e!690588))

(assert (=> start!101420 tp_is_empty!30811))

(declare-fun array_inv!28886 (array!78445) Bool)

(assert (=> start!101420 (array_inv!28886 _keys!1208)))

(assert (=> start!101420 true))

(assert (=> start!101420 tp!91342))

(declare-fun e!690586 () Bool)

(declare-fun array_inv!28887 (array!78443) Bool)

(assert (=> start!101420 (and (array_inv!28887 _values!996) e!690586)))

(declare-fun b!1215919 () Bool)

(declare-fun res!806909 () Bool)

(assert (=> b!1215919 (=> (not res!806909) (not e!690588))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1215919 (= res!806909 (validMask!0 mask!1564))))

(declare-fun b!1215920 () Bool)

(assert (=> b!1215920 (= e!690590 true)))

(declare-fun zeroValue!944 () V!46209)

(declare-fun lt!552873 () array!78445)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19896 0))(
  ( (tuple2!19897 (_1!9959 (_ BitVec 64)) (_2!9959 V!46209)) )
))
(declare-datatypes ((List!26697 0))(
  ( (Nil!26694) (Cons!26693 (h!27911 tuple2!19896) (t!39776 List!26697)) )
))
(declare-datatypes ((ListLongMap!17873 0))(
  ( (ListLongMap!17874 (toList!8952 List!26697)) )
))
(declare-fun lt!552876 () ListLongMap!17873)

(declare-fun minValue!944 () V!46209)

(declare-fun getCurrentListMapNoExtraKeys!5409 (array!78445 array!78443 (_ BitVec 32) (_ BitVec 32) V!46209 V!46209 (_ BitVec 32) Int) ListLongMap!17873)

(declare-fun dynLambda!3321 (Int (_ BitVec 64)) V!46209)

(assert (=> b!1215920 (= lt!552876 (getCurrentListMapNoExtraKeys!5409 lt!552873 (array!78444 (store (arr!37850 _values!996) i!673 (ValueCellFull!14696 (dynLambda!3321 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38387 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!552874 () ListLongMap!17873)

(assert (=> b!1215920 (= lt!552874 (getCurrentListMapNoExtraKeys!5409 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1215921 () Bool)

(declare-fun res!806904 () Bool)

(assert (=> b!1215921 (=> (not res!806904) (not e!690591))))

(declare-datatypes ((List!26698 0))(
  ( (Nil!26695) (Cons!26694 (h!27912 (_ BitVec 64)) (t!39777 List!26698)) )
))
(declare-fun arrayNoDuplicates!0 (array!78445 (_ BitVec 32) List!26698) Bool)

(assert (=> b!1215921 (= res!806904 (arrayNoDuplicates!0 lt!552873 #b00000000000000000000000000000000 Nil!26695))))

(declare-fun b!1215922 () Bool)

(declare-fun res!806910 () Bool)

(assert (=> b!1215922 (=> (not res!806910) (not e!690588))))

(assert (=> b!1215922 (= res!806910 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26695))))

(declare-fun b!1215923 () Bool)

(declare-fun res!806906 () Bool)

(assert (=> b!1215923 (=> (not res!806906) (not e!690588))))

(assert (=> b!1215923 (= res!806906 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38388 _keys!1208))))))

(declare-fun b!1215924 () Bool)

(declare-fun res!806908 () Bool)

(assert (=> b!1215924 (=> (not res!806908) (not e!690588))))

(assert (=> b!1215924 (= res!806908 (and (= (size!38387 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38388 _keys!1208) (size!38387 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!48091 () Bool)

(assert (=> mapIsEmpty!48091 mapRes!48091))

(declare-fun b!1215925 () Bool)

(declare-fun res!806905 () Bool)

(assert (=> b!1215925 (=> (not res!806905) (not e!690588))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78445 (_ BitVec 32)) Bool)

(assert (=> b!1215925 (= res!806905 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1215926 () Bool)

(declare-fun e!690587 () Bool)

(assert (=> b!1215926 (= e!690586 (and e!690587 mapRes!48091))))

(declare-fun condMapEmpty!48091 () Bool)

(declare-fun mapDefault!48091 () ValueCell!14696)

(assert (=> b!1215926 (= condMapEmpty!48091 (= (arr!37850 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14696)) mapDefault!48091)))))

(declare-fun b!1215927 () Bool)

(assert (=> b!1215927 (= e!690587 tp_is_empty!30811)))

(declare-fun b!1215928 () Bool)

(assert (=> b!1215928 (= e!690588 e!690591)))

(declare-fun res!806907 () Bool)

(assert (=> b!1215928 (=> (not res!806907) (not e!690591))))

(assert (=> b!1215928 (= res!806907 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552873 mask!1564))))

(assert (=> b!1215928 (= lt!552873 (array!78446 (store (arr!37851 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38388 _keys!1208)))))

(assert (= (and start!101420 res!806903) b!1215919))

(assert (= (and b!1215919 res!806909) b!1215924))

(assert (= (and b!1215924 res!806908) b!1215925))

(assert (= (and b!1215925 res!806905) b!1215922))

(assert (= (and b!1215922 res!806910) b!1215923))

(assert (= (and b!1215923 res!806906) b!1215917))

(assert (= (and b!1215917 res!806911) b!1215915))

(assert (= (and b!1215915 res!806901) b!1215928))

(assert (= (and b!1215928 res!806907) b!1215921))

(assert (= (and b!1215921 res!806904) b!1215918))

(assert (= (and b!1215918 (not res!806902)) b!1215920))

(assert (= (and b!1215926 condMapEmpty!48091) mapIsEmpty!48091))

(assert (= (and b!1215926 (not condMapEmpty!48091)) mapNonEmpty!48091))

(get-info :version)

(assert (= (and mapNonEmpty!48091 ((_ is ValueCellFull!14696) mapValue!48091)) b!1215916))

(assert (= (and b!1215926 ((_ is ValueCellFull!14696) mapDefault!48091)) b!1215927))

(assert (= start!101420 b!1215926))

(declare-fun b_lambda!21777 () Bool)

(assert (=> (not b_lambda!21777) (not b!1215920)))

(declare-fun t!39775 () Bool)

(declare-fun tb!10899 () Bool)

(assert (=> (and start!101420 (= defaultEntry!1004 defaultEntry!1004) t!39775) tb!10899))

(declare-fun result!22403 () Bool)

(assert (=> tb!10899 (= result!22403 tp_is_empty!30811)))

(assert (=> b!1215920 t!39775))

(declare-fun b_and!43335 () Bool)

(assert (= b_and!43333 (and (=> t!39775 result!22403) b_and!43335)))

(declare-fun m!1121373 () Bool)

(assert (=> start!101420 m!1121373))

(declare-fun m!1121375 () Bool)

(assert (=> start!101420 m!1121375))

(declare-fun m!1121377 () Bool)

(assert (=> b!1215925 m!1121377))

(declare-fun m!1121379 () Bool)

(assert (=> b!1215928 m!1121379))

(declare-fun m!1121381 () Bool)

(assert (=> b!1215928 m!1121381))

(declare-fun m!1121383 () Bool)

(assert (=> b!1215922 m!1121383))

(declare-fun m!1121385 () Bool)

(assert (=> b!1215921 m!1121385))

(declare-fun m!1121387 () Bool)

(assert (=> b!1215917 m!1121387))

(declare-fun m!1121389 () Bool)

(assert (=> b!1215920 m!1121389))

(declare-fun m!1121391 () Bool)

(assert (=> b!1215920 m!1121391))

(declare-fun m!1121393 () Bool)

(assert (=> b!1215920 m!1121393))

(declare-fun m!1121395 () Bool)

(assert (=> b!1215920 m!1121395))

(declare-fun m!1121397 () Bool)

(assert (=> b!1215919 m!1121397))

(declare-fun m!1121399 () Bool)

(assert (=> mapNonEmpty!48091 m!1121399))

(declare-fun m!1121401 () Bool)

(assert (=> b!1215918 m!1121401))

(declare-fun m!1121403 () Bool)

(assert (=> b!1215918 m!1121403))

(declare-fun m!1121405 () Bool)

(assert (=> b!1215915 m!1121405))

(check-sat (not b!1215922) (not start!101420) (not b!1215917) (not b_next!26107) (not b!1215918) (not b!1215920) tp_is_empty!30811 (not b!1215925) (not b!1215921) b_and!43335 (not b!1215919) (not b!1215928) (not mapNonEmpty!48091) (not b_lambda!21777))
(check-sat b_and!43335 (not b_next!26107))
