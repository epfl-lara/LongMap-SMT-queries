; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101246 () Bool)

(assert start!101246)

(declare-fun b_free!26169 () Bool)

(declare-fun b_next!26169 () Bool)

(assert (=> start!101246 (= b_free!26169 (not b_next!26169))))

(declare-fun tp!91529 () Bool)

(declare-fun b_and!43455 () Bool)

(assert (=> start!101246 (= tp!91529 b_and!43455)))

(declare-fun b!1215992 () Bool)

(declare-fun e!690411 () Bool)

(declare-fun e!690407 () Bool)

(assert (=> b!1215992 (= e!690411 e!690407)))

(declare-fun res!807424 () Bool)

(assert (=> b!1215992 (=> (not res!807424) (not e!690407))))

(declare-datatypes ((array!78519 0))(
  ( (array!78520 (arr!37894 (Array (_ BitVec 32) (_ BitVec 64))) (size!38430 (_ BitVec 32))) )
))
(declare-fun lt!552767 () array!78519)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78519 (_ BitVec 32)) Bool)

(assert (=> b!1215992 (= res!807424 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552767 mask!1564))))

(declare-fun _keys!1208 () array!78519)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1215992 (= lt!552767 (array!78520 (store (arr!37894 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38430 _keys!1208)))))

(declare-fun b!1215993 () Bool)

(declare-fun res!807426 () Bool)

(assert (=> b!1215993 (=> (not res!807426) (not e!690411))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1215993 (= res!807426 (= (select (arr!37894 _keys!1208) i!673) k0!934))))

(declare-fun b!1215994 () Bool)

(declare-fun res!807423 () Bool)

(assert (=> b!1215994 (=> (not res!807423) (not e!690411))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!46291 0))(
  ( (V!46292 (val!15493 Int)) )
))
(declare-datatypes ((ValueCell!14727 0))(
  ( (ValueCellFull!14727 (v!18146 V!46291)) (EmptyCell!14727) )
))
(declare-datatypes ((array!78521 0))(
  ( (array!78522 (arr!37895 (Array (_ BitVec 32) ValueCell!14727)) (size!38431 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78521)

(assert (=> b!1215994 (= res!807423 (and (= (size!38431 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38430 _keys!1208) (size!38431 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1215995 () Bool)

(declare-fun res!807428 () Bool)

(assert (=> b!1215995 (=> (not res!807428) (not e!690407))))

(declare-datatypes ((List!26713 0))(
  ( (Nil!26710) (Cons!26709 (h!27918 (_ BitVec 64)) (t!39862 List!26713)) )
))
(declare-fun arrayNoDuplicates!0 (array!78519 (_ BitVec 32) List!26713) Bool)

(assert (=> b!1215995 (= res!807428 (arrayNoDuplicates!0 lt!552767 #b00000000000000000000000000000000 Nil!26710))))

(declare-fun b!1215996 () Bool)

(declare-fun res!807427 () Bool)

(assert (=> b!1215996 (=> (not res!807427) (not e!690411))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1215996 (= res!807427 (validMask!0 mask!1564))))

(declare-fun b!1215997 () Bool)

(declare-fun e!690409 () Bool)

(declare-fun tp_is_empty!30873 () Bool)

(assert (=> b!1215997 (= e!690409 tp_is_empty!30873)))

(declare-fun b!1215998 () Bool)

(declare-fun res!807418 () Bool)

(assert (=> b!1215998 (=> (not res!807418) (not e!690411))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1215998 (= res!807418 (validKeyInArray!0 k0!934))))

(declare-fun b!1215999 () Bool)

(declare-fun res!807420 () Bool)

(assert (=> b!1215999 (=> (not res!807420) (not e!690411))))

(assert (=> b!1215999 (= res!807420 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26710))))

(declare-fun b!1216000 () Bool)

(declare-fun res!807422 () Bool)

(assert (=> b!1216000 (=> (not res!807422) (not e!690411))))

(assert (=> b!1216000 (= res!807422 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38430 _keys!1208))))))

(declare-fun b!1216001 () Bool)

(declare-fun e!690410 () Bool)

(declare-fun mapRes!48184 () Bool)

(assert (=> b!1216001 (= e!690410 (and e!690409 mapRes!48184))))

(declare-fun condMapEmpty!48184 () Bool)

(declare-fun mapDefault!48184 () ValueCell!14727)

(assert (=> b!1216001 (= condMapEmpty!48184 (= (arr!37895 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14727)) mapDefault!48184)))))

(declare-fun res!807425 () Bool)

(assert (=> start!101246 (=> (not res!807425) (not e!690411))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!101246 (= res!807425 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38430 _keys!1208))))))

(assert (=> start!101246 e!690411))

(assert (=> start!101246 tp_is_empty!30873))

(declare-fun array_inv!28852 (array!78519) Bool)

(assert (=> start!101246 (array_inv!28852 _keys!1208)))

(assert (=> start!101246 true))

(assert (=> start!101246 tp!91529))

(declare-fun array_inv!28853 (array!78521) Bool)

(assert (=> start!101246 (and (array_inv!28853 _values!996) e!690410)))

(declare-fun b!1216002 () Bool)

(declare-fun e!690412 () Bool)

(assert (=> b!1216002 (= e!690412 tp_is_empty!30873)))

(declare-fun b!1216003 () Bool)

(declare-fun e!690406 () Bool)

(assert (=> b!1216003 (= e!690406 true)))

(declare-fun zeroValue!944 () V!46291)

(declare-datatypes ((tuple2!19910 0))(
  ( (tuple2!19911 (_1!9966 (_ BitVec 64)) (_2!9966 V!46291)) )
))
(declare-datatypes ((List!26714 0))(
  ( (Nil!26711) (Cons!26710 (h!27919 tuple2!19910) (t!39863 List!26714)) )
))
(declare-datatypes ((ListLongMap!17879 0))(
  ( (ListLongMap!17880 (toList!8955 List!26714)) )
))
(declare-fun lt!552765 () ListLongMap!17879)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46291)

(declare-fun getCurrentListMapNoExtraKeys!5382 (array!78519 array!78521 (_ BitVec 32) (_ BitVec 32) V!46291 V!46291 (_ BitVec 32) Int) ListLongMap!17879)

(declare-fun dynLambda!3271 (Int (_ BitVec 64)) V!46291)

(assert (=> b!1216003 (= lt!552765 (getCurrentListMapNoExtraKeys!5382 lt!552767 (array!78522 (store (arr!37895 _values!996) i!673 (ValueCellFull!14727 (dynLambda!3271 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38431 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!552766 () ListLongMap!17879)

(assert (=> b!1216003 (= lt!552766 (getCurrentListMapNoExtraKeys!5382 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1216004 () Bool)

(declare-fun res!807421 () Bool)

(assert (=> b!1216004 (=> (not res!807421) (not e!690411))))

(assert (=> b!1216004 (= res!807421 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1216005 () Bool)

(assert (=> b!1216005 (= e!690407 (not e!690406))))

(declare-fun res!807419 () Bool)

(assert (=> b!1216005 (=> res!807419 e!690406)))

(assert (=> b!1216005 (= res!807419 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78519 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1216005 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40316 0))(
  ( (Unit!40317) )
))
(declare-fun lt!552768 () Unit!40316)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78519 (_ BitVec 64) (_ BitVec 32)) Unit!40316)

(assert (=> b!1216005 (= lt!552768 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!48184 () Bool)

(declare-fun tp!91528 () Bool)

(assert (=> mapNonEmpty!48184 (= mapRes!48184 (and tp!91528 e!690412))))

(declare-fun mapKey!48184 () (_ BitVec 32))

(declare-fun mapRest!48184 () (Array (_ BitVec 32) ValueCell!14727))

(declare-fun mapValue!48184 () ValueCell!14727)

(assert (=> mapNonEmpty!48184 (= (arr!37895 _values!996) (store mapRest!48184 mapKey!48184 mapValue!48184))))

(declare-fun mapIsEmpty!48184 () Bool)

(assert (=> mapIsEmpty!48184 mapRes!48184))

(assert (= (and start!101246 res!807425) b!1215996))

(assert (= (and b!1215996 res!807427) b!1215994))

(assert (= (and b!1215994 res!807423) b!1216004))

(assert (= (and b!1216004 res!807421) b!1215999))

(assert (= (and b!1215999 res!807420) b!1216000))

(assert (= (and b!1216000 res!807422) b!1215998))

(assert (= (and b!1215998 res!807418) b!1215993))

(assert (= (and b!1215993 res!807426) b!1215992))

(assert (= (and b!1215992 res!807424) b!1215995))

(assert (= (and b!1215995 res!807428) b!1216005))

(assert (= (and b!1216005 (not res!807419)) b!1216003))

(assert (= (and b!1216001 condMapEmpty!48184) mapIsEmpty!48184))

(assert (= (and b!1216001 (not condMapEmpty!48184)) mapNonEmpty!48184))

(get-info :version)

(assert (= (and mapNonEmpty!48184 ((_ is ValueCellFull!14727) mapValue!48184)) b!1216002))

(assert (= (and b!1216001 ((_ is ValueCellFull!14727) mapDefault!48184)) b!1215997))

(assert (= start!101246 b!1216001))

(declare-fun b_lambda!21845 () Bool)

(assert (=> (not b_lambda!21845) (not b!1216003)))

(declare-fun t!39861 () Bool)

(declare-fun tb!10969 () Bool)

(assert (=> (and start!101246 (= defaultEntry!1004 defaultEntry!1004) t!39861) tb!10969))

(declare-fun result!22535 () Bool)

(assert (=> tb!10969 (= result!22535 tp_is_empty!30873)))

(assert (=> b!1216003 t!39861))

(declare-fun b_and!43457 () Bool)

(assert (= b_and!43455 (and (=> t!39861 result!22535) b_and!43457)))

(declare-fun m!1120837 () Bool)

(assert (=> b!1215998 m!1120837))

(declare-fun m!1120839 () Bool)

(assert (=> b!1215999 m!1120839))

(declare-fun m!1120841 () Bool)

(assert (=> b!1215992 m!1120841))

(declare-fun m!1120843 () Bool)

(assert (=> b!1215992 m!1120843))

(declare-fun m!1120845 () Bool)

(assert (=> b!1216004 m!1120845))

(declare-fun m!1120847 () Bool)

(assert (=> start!101246 m!1120847))

(declare-fun m!1120849 () Bool)

(assert (=> start!101246 m!1120849))

(declare-fun m!1120851 () Bool)

(assert (=> b!1216003 m!1120851))

(declare-fun m!1120853 () Bool)

(assert (=> b!1216003 m!1120853))

(declare-fun m!1120855 () Bool)

(assert (=> b!1216003 m!1120855))

(declare-fun m!1120857 () Bool)

(assert (=> b!1216003 m!1120857))

(declare-fun m!1120859 () Bool)

(assert (=> mapNonEmpty!48184 m!1120859))

(declare-fun m!1120861 () Bool)

(assert (=> b!1215996 m!1120861))

(declare-fun m!1120863 () Bool)

(assert (=> b!1215995 m!1120863))

(declare-fun m!1120865 () Bool)

(assert (=> b!1216005 m!1120865))

(declare-fun m!1120867 () Bool)

(assert (=> b!1216005 m!1120867))

(declare-fun m!1120869 () Bool)

(assert (=> b!1215993 m!1120869))

(check-sat (not b!1215992) (not b_next!26169) b_and!43457 tp_is_empty!30873 (not mapNonEmpty!48184) (not b!1216003) (not b!1215995) (not start!101246) (not b!1215996) (not b!1215998) (not b!1216005) (not b!1215999) (not b!1216004) (not b_lambda!21845))
(check-sat b_and!43457 (not b_next!26169))
