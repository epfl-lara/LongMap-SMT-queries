; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100756 () Bool)

(assert start!100756)

(declare-fun b_free!25843 () Bool)

(declare-fun b_next!25843 () Bool)

(assert (=> start!100756 (= b_free!25843 (not b_next!25843))))

(declare-fun tp!90518 () Bool)

(declare-fun b_and!42575 () Bool)

(assert (=> start!100756 (= tp!90518 b_and!42575)))

(declare-fun b!1202398 () Bool)

(declare-fun e!682917 () Bool)

(declare-fun e!682919 () Bool)

(assert (=> b!1202398 (= e!682917 e!682919)))

(declare-fun res!800084 () Bool)

(assert (=> b!1202398 (=> res!800084 e!682919)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1202398 (= res!800084 (not (= from!1455 i!673)))))

(declare-datatypes ((V!45857 0))(
  ( (V!45858 (val!15330 Int)) )
))
(declare-fun zeroValue!944 () V!45857)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14564 0))(
  ( (ValueCellFull!14564 (v!17964 V!45857)) (EmptyCell!14564) )
))
(declare-datatypes ((array!77905 0))(
  ( (array!77906 (arr!37591 (Array (_ BitVec 32) ValueCell!14564)) (size!38128 (_ BitVec 32))) )
))
(declare-fun lt!544781 () array!77905)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((array!77907 0))(
  ( (array!77908 (arr!37592 (Array (_ BitVec 32) (_ BitVec 64))) (size!38129 (_ BitVec 32))) )
))
(declare-fun lt!544784 () array!77907)

(declare-datatypes ((tuple2!19648 0))(
  ( (tuple2!19649 (_1!9835 (_ BitVec 64)) (_2!9835 V!45857)) )
))
(declare-datatypes ((List!26464 0))(
  ( (Nil!26461) (Cons!26460 (h!27678 tuple2!19648) (t!39279 List!26464)) )
))
(declare-datatypes ((ListLongMap!17625 0))(
  ( (ListLongMap!17626 (toList!8828 List!26464)) )
))
(declare-fun lt!544782 () ListLongMap!17625)

(declare-fun minValue!944 () V!45857)

(declare-fun getCurrentListMapNoExtraKeys!5295 (array!77907 array!77905 (_ BitVec 32) (_ BitVec 32) V!45857 V!45857 (_ BitVec 32) Int) ListLongMap!17625)

(assert (=> b!1202398 (= lt!544782 (getCurrentListMapNoExtraKeys!5295 lt!544784 lt!544781 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!77905)

(declare-fun dynLambda!3236 (Int (_ BitVec 64)) V!45857)

(assert (=> b!1202398 (= lt!544781 (array!77906 (store (arr!37591 _values!996) i!673 (ValueCellFull!14564 (dynLambda!3236 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38128 _values!996)))))

(declare-fun lt!544779 () ListLongMap!17625)

(declare-fun _keys!1208 () array!77907)

(assert (=> b!1202398 (= lt!544779 (getCurrentListMapNoExtraKeys!5295 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1202399 () Bool)

(declare-fun e!682915 () Bool)

(assert (=> b!1202399 (= e!682919 e!682915)))

(declare-fun res!800082 () Bool)

(assert (=> b!1202399 (=> res!800082 e!682915)))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1202399 (= res!800082 (not (= (select (arr!37592 _keys!1208) from!1455) k0!934)))))

(declare-fun e!682910 () Bool)

(assert (=> b!1202399 e!682910))

(declare-fun c!117874 () Bool)

(assert (=> b!1202399 (= c!117874 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!39781 0))(
  ( (Unit!39782) )
))
(declare-fun lt!544780 () Unit!39781)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1005 (array!77907 array!77905 (_ BitVec 32) (_ BitVec 32) V!45857 V!45857 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39781)

(assert (=> b!1202399 (= lt!544780 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1005 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1202401 () Bool)

(declare-fun res!800086 () Bool)

(declare-fun e!682912 () Bool)

(assert (=> b!1202401 (=> (not res!800086) (not e!682912))))

(assert (=> b!1202401 (= res!800086 (and (= (size!38128 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38129 _keys!1208) (size!38128 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1202402 () Bool)

(declare-fun e!682913 () Bool)

(declare-fun tp_is_empty!30547 () Bool)

(assert (=> b!1202402 (= e!682913 tp_is_empty!30547)))

(declare-fun b!1202403 () Bool)

(assert (=> b!1202403 (= e!682915 true)))

(declare-fun lt!544783 () Bool)

(declare-fun contains!6907 (ListLongMap!17625 (_ BitVec 64)) Bool)

(assert (=> b!1202403 (= lt!544783 (contains!6907 (getCurrentListMapNoExtraKeys!5295 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1202404 () Bool)

(declare-fun res!800080 () Bool)

(assert (=> b!1202404 (=> (not res!800080) (not e!682912))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77907 (_ BitVec 32)) Bool)

(assert (=> b!1202404 (= res!800080 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1202405 () Bool)

(declare-fun e!682911 () Bool)

(assert (=> b!1202405 (= e!682912 e!682911)))

(declare-fun res!800088 () Bool)

(assert (=> b!1202405 (=> (not res!800088) (not e!682911))))

(assert (=> b!1202405 (= res!800088 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!544784 mask!1564))))

(assert (=> b!1202405 (= lt!544784 (array!77908 (store (arr!37592 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38129 _keys!1208)))))

(declare-fun b!1202406 () Bool)

(declare-fun e!682916 () Bool)

(declare-fun mapRes!47663 () Bool)

(assert (=> b!1202406 (= e!682916 (and e!682913 mapRes!47663))))

(declare-fun condMapEmpty!47663 () Bool)

(declare-fun mapDefault!47663 () ValueCell!14564)

(assert (=> b!1202406 (= condMapEmpty!47663 (= (arr!37591 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14564)) mapDefault!47663)))))

(declare-fun b!1202407 () Bool)

(declare-fun res!800092 () Bool)

(assert (=> b!1202407 (=> (not res!800092) (not e!682912))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1202407 (= res!800092 (validKeyInArray!0 k0!934))))

(declare-fun b!1202408 () Bool)

(declare-fun res!800081 () Bool)

(assert (=> b!1202408 (=> (not res!800081) (not e!682911))))

(declare-datatypes ((List!26465 0))(
  ( (Nil!26462) (Cons!26461 (h!27679 (_ BitVec 64)) (t!39280 List!26465)) )
))
(declare-fun arrayNoDuplicates!0 (array!77907 (_ BitVec 32) List!26465) Bool)

(assert (=> b!1202408 (= res!800081 (arrayNoDuplicates!0 lt!544784 #b00000000000000000000000000000000 Nil!26462))))

(declare-fun b!1202409 () Bool)

(declare-fun e!682914 () Bool)

(assert (=> b!1202409 (= e!682914 tp_is_empty!30547)))

(declare-fun b!1202410 () Bool)

(declare-fun res!800085 () Bool)

(assert (=> b!1202410 (=> (not res!800085) (not e!682912))))

(assert (=> b!1202410 (= res!800085 (= (select (arr!37592 _keys!1208) i!673) k0!934))))

(declare-fun b!1202411 () Bool)

(declare-fun res!800091 () Bool)

(assert (=> b!1202411 (=> (not res!800091) (not e!682912))))

(assert (=> b!1202411 (= res!800091 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38129 _keys!1208))))))

(declare-fun b!1202412 () Bool)

(declare-fun call!57423 () ListLongMap!17625)

(declare-fun call!57424 () ListLongMap!17625)

(assert (=> b!1202412 (= e!682910 (= call!57423 call!57424))))

(declare-fun b!1202400 () Bool)

(declare-fun -!1785 (ListLongMap!17625 (_ BitVec 64)) ListLongMap!17625)

(assert (=> b!1202400 (= e!682910 (= call!57423 (-!1785 call!57424 k0!934)))))

(declare-fun res!800089 () Bool)

(assert (=> start!100756 (=> (not res!800089) (not e!682912))))

(assert (=> start!100756 (= res!800089 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38129 _keys!1208))))))

(assert (=> start!100756 e!682912))

(assert (=> start!100756 tp_is_empty!30547))

(declare-fun array_inv!28712 (array!77907) Bool)

(assert (=> start!100756 (array_inv!28712 _keys!1208)))

(assert (=> start!100756 true))

(assert (=> start!100756 tp!90518))

(declare-fun array_inv!28713 (array!77905) Bool)

(assert (=> start!100756 (and (array_inv!28713 _values!996) e!682916)))

(declare-fun b!1202413 () Bool)

(declare-fun res!800087 () Bool)

(assert (=> b!1202413 (=> (not res!800087) (not e!682912))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1202413 (= res!800087 (validMask!0 mask!1564))))

(declare-fun b!1202414 () Bool)

(declare-fun res!800090 () Bool)

(assert (=> b!1202414 (=> (not res!800090) (not e!682912))))

(assert (=> b!1202414 (= res!800090 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26462))))

(declare-fun b!1202415 () Bool)

(assert (=> b!1202415 (= e!682911 (not e!682917))))

(declare-fun res!800083 () Bool)

(assert (=> b!1202415 (=> res!800083 e!682917)))

(assert (=> b!1202415 (= res!800083 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77907 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1202415 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!544778 () Unit!39781)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77907 (_ BitVec 64) (_ BitVec 32)) Unit!39781)

(assert (=> b!1202415 (= lt!544778 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!57420 () Bool)

(assert (=> bm!57420 (= call!57423 (getCurrentListMapNoExtraKeys!5295 lt!544784 lt!544781 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!57421 () Bool)

(assert (=> bm!57421 (= call!57424 (getCurrentListMapNoExtraKeys!5295 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!47663 () Bool)

(assert (=> mapIsEmpty!47663 mapRes!47663))

(declare-fun mapNonEmpty!47663 () Bool)

(declare-fun tp!90519 () Bool)

(assert (=> mapNonEmpty!47663 (= mapRes!47663 (and tp!90519 e!682914))))

(declare-fun mapRest!47663 () (Array (_ BitVec 32) ValueCell!14564))

(declare-fun mapKey!47663 () (_ BitVec 32))

(declare-fun mapValue!47663 () ValueCell!14564)

(assert (=> mapNonEmpty!47663 (= (arr!37591 _values!996) (store mapRest!47663 mapKey!47663 mapValue!47663))))

(assert (= (and start!100756 res!800089) b!1202413))

(assert (= (and b!1202413 res!800087) b!1202401))

(assert (= (and b!1202401 res!800086) b!1202404))

(assert (= (and b!1202404 res!800080) b!1202414))

(assert (= (and b!1202414 res!800090) b!1202411))

(assert (= (and b!1202411 res!800091) b!1202407))

(assert (= (and b!1202407 res!800092) b!1202410))

(assert (= (and b!1202410 res!800085) b!1202405))

(assert (= (and b!1202405 res!800088) b!1202408))

(assert (= (and b!1202408 res!800081) b!1202415))

(assert (= (and b!1202415 (not res!800083)) b!1202398))

(assert (= (and b!1202398 (not res!800084)) b!1202399))

(assert (= (and b!1202399 c!117874) b!1202400))

(assert (= (and b!1202399 (not c!117874)) b!1202412))

(assert (= (or b!1202400 b!1202412) bm!57420))

(assert (= (or b!1202400 b!1202412) bm!57421))

(assert (= (and b!1202399 (not res!800082)) b!1202403))

(assert (= (and b!1202406 condMapEmpty!47663) mapIsEmpty!47663))

(assert (= (and b!1202406 (not condMapEmpty!47663)) mapNonEmpty!47663))

(get-info :version)

(assert (= (and mapNonEmpty!47663 ((_ is ValueCellFull!14564) mapValue!47663)) b!1202409))

(assert (= (and b!1202406 ((_ is ValueCellFull!14564) mapDefault!47663)) b!1202402))

(assert (= start!100756 b!1202406))

(declare-fun b_lambda!21033 () Bool)

(assert (=> (not b_lambda!21033) (not b!1202398)))

(declare-fun t!39278 () Bool)

(declare-fun tb!10635 () Bool)

(assert (=> (and start!100756 (= defaultEntry!1004 defaultEntry!1004) t!39278) tb!10635))

(declare-fun result!21855 () Bool)

(assert (=> tb!10635 (= result!21855 tp_is_empty!30547)))

(assert (=> b!1202398 t!39278))

(declare-fun b_and!42577 () Bool)

(assert (= b_and!42575 (and (=> t!39278 result!21855) b_and!42577)))

(declare-fun m!1108865 () Bool)

(assert (=> b!1202404 m!1108865))

(declare-fun m!1108867 () Bool)

(assert (=> b!1202398 m!1108867))

(declare-fun m!1108869 () Bool)

(assert (=> b!1202398 m!1108869))

(declare-fun m!1108871 () Bool)

(assert (=> b!1202398 m!1108871))

(declare-fun m!1108873 () Bool)

(assert (=> b!1202398 m!1108873))

(declare-fun m!1108875 () Bool)

(assert (=> b!1202414 m!1108875))

(declare-fun m!1108877 () Bool)

(assert (=> b!1202408 m!1108877))

(declare-fun m!1108879 () Bool)

(assert (=> start!100756 m!1108879))

(declare-fun m!1108881 () Bool)

(assert (=> start!100756 m!1108881))

(declare-fun m!1108883 () Bool)

(assert (=> b!1202407 m!1108883))

(declare-fun m!1108885 () Bool)

(assert (=> b!1202410 m!1108885))

(declare-fun m!1108887 () Bool)

(assert (=> bm!57421 m!1108887))

(declare-fun m!1108889 () Bool)

(assert (=> b!1202400 m!1108889))

(declare-fun m!1108891 () Bool)

(assert (=> bm!57420 m!1108891))

(declare-fun m!1108893 () Bool)

(assert (=> b!1202413 m!1108893))

(declare-fun m!1108895 () Bool)

(assert (=> b!1202415 m!1108895))

(declare-fun m!1108897 () Bool)

(assert (=> b!1202415 m!1108897))

(declare-fun m!1108899 () Bool)

(assert (=> mapNonEmpty!47663 m!1108899))

(declare-fun m!1108901 () Bool)

(assert (=> b!1202399 m!1108901))

(declare-fun m!1108903 () Bool)

(assert (=> b!1202399 m!1108903))

(assert (=> b!1202403 m!1108887))

(assert (=> b!1202403 m!1108887))

(declare-fun m!1108905 () Bool)

(assert (=> b!1202403 m!1108905))

(declare-fun m!1108907 () Bool)

(assert (=> b!1202405 m!1108907))

(declare-fun m!1108909 () Bool)

(assert (=> b!1202405 m!1108909))

(check-sat (not b!1202400) (not bm!57421) tp_is_empty!30547 (not b!1202404) (not b!1202403) b_and!42577 (not b!1202413) (not bm!57420) (not b!1202408) (not b!1202414) (not start!100756) (not mapNonEmpty!47663) (not b!1202407) (not b!1202398) (not b_lambda!21033) (not b!1202415) (not b!1202399) (not b!1202405) (not b_next!25843))
(check-sat b_and!42577 (not b_next!25843))
