; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100450 () Bool)

(assert start!100450)

(declare-fun b_free!25773 () Bool)

(declare-fun b_next!25773 () Bool)

(assert (=> start!100450 (= b_free!25773 (not b_next!25773))))

(declare-fun tp!90309 () Bool)

(declare-fun b_and!42433 () Bool)

(assert (=> start!100450 (= tp!90309 b_and!42433)))

(declare-fun b!1199408 () Bool)

(declare-fun e!681231 () Bool)

(assert (=> b!1199408 (= e!681231 true)))

(declare-datatypes ((V!45763 0))(
  ( (V!45764 (val!15295 Int)) )
))
(declare-fun zeroValue!944 () V!45763)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14529 0))(
  ( (ValueCellFull!14529 (v!17933 V!45763)) (EmptyCell!14529) )
))
(declare-datatypes ((array!77729 0))(
  ( (array!77730 (arr!37509 (Array (_ BitVec 32) ValueCell!14529)) (size!38045 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77729)

(declare-datatypes ((array!77731 0))(
  ( (array!77732 (arr!37510 (Array (_ BitVec 32) (_ BitVec 64))) (size!38046 (_ BitVec 32))) )
))
(declare-fun lt!543760 () array!77731)

(declare-datatypes ((tuple2!19578 0))(
  ( (tuple2!19579 (_1!9800 (_ BitVec 64)) (_2!9800 V!45763)) )
))
(declare-datatypes ((List!26394 0))(
  ( (Nil!26391) (Cons!26390 (h!27599 tuple2!19578) (t!39147 List!26394)) )
))
(declare-datatypes ((ListLongMap!17547 0))(
  ( (ListLongMap!17548 (toList!8789 List!26394)) )
))
(declare-fun lt!543761 () ListLongMap!17547)

(declare-fun minValue!944 () V!45763)

(declare-fun getCurrentListMapNoExtraKeys!5228 (array!77731 array!77729 (_ BitVec 32) (_ BitVec 32) V!45763 V!45763 (_ BitVec 32) Int) ListLongMap!17547)

(declare-fun dynLambda!3148 (Int (_ BitVec 64)) V!45763)

(assert (=> b!1199408 (= lt!543761 (getCurrentListMapNoExtraKeys!5228 lt!543760 (array!77730 (store (arr!37509 _values!996) i!673 (ValueCellFull!14529 (dynLambda!3148 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38045 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _keys!1208 () array!77731)

(declare-fun lt!543763 () ListLongMap!17547)

(assert (=> b!1199408 (= lt!543763 (getCurrentListMapNoExtraKeys!5228 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1199409 () Bool)

(declare-fun e!681232 () Bool)

(declare-fun e!681234 () Bool)

(declare-fun mapRes!47558 () Bool)

(assert (=> b!1199409 (= e!681232 (and e!681234 mapRes!47558))))

(declare-fun condMapEmpty!47558 () Bool)

(declare-fun mapDefault!47558 () ValueCell!14529)

(assert (=> b!1199409 (= condMapEmpty!47558 (= (arr!37509 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14529)) mapDefault!47558)))))

(declare-fun b!1199410 () Bool)

(declare-fun e!681233 () Bool)

(assert (=> b!1199410 (= e!681233 (not e!681231))))

(declare-fun res!798338 () Bool)

(assert (=> b!1199410 (=> res!798338 e!681231)))

(assert (=> b!1199410 (= res!798338 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77731 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1199410 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39764 0))(
  ( (Unit!39765) )
))
(declare-fun lt!543762 () Unit!39764)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77731 (_ BitVec 64) (_ BitVec 32)) Unit!39764)

(assert (=> b!1199410 (= lt!543762 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1199411 () Bool)

(declare-fun tp_is_empty!30477 () Bool)

(assert (=> b!1199411 (= e!681234 tp_is_empty!30477)))

(declare-fun b!1199412 () Bool)

(declare-fun res!798339 () Bool)

(declare-fun e!681230 () Bool)

(assert (=> b!1199412 (=> (not res!798339) (not e!681230))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77731 (_ BitVec 32)) Bool)

(assert (=> b!1199412 (= res!798339 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!47558 () Bool)

(declare-fun tp!90308 () Bool)

(declare-fun e!681229 () Bool)

(assert (=> mapNonEmpty!47558 (= mapRes!47558 (and tp!90308 e!681229))))

(declare-fun mapValue!47558 () ValueCell!14529)

(declare-fun mapKey!47558 () (_ BitVec 32))

(declare-fun mapRest!47558 () (Array (_ BitVec 32) ValueCell!14529))

(assert (=> mapNonEmpty!47558 (= (arr!37509 _values!996) (store mapRest!47558 mapKey!47558 mapValue!47558))))

(declare-fun b!1199413 () Bool)

(assert (=> b!1199413 (= e!681229 tp_is_empty!30477)))

(declare-fun b!1199414 () Bool)

(assert (=> b!1199414 (= e!681230 e!681233)))

(declare-fun res!798332 () Bool)

(assert (=> b!1199414 (=> (not res!798332) (not e!681233))))

(assert (=> b!1199414 (= res!798332 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543760 mask!1564))))

(assert (=> b!1199414 (= lt!543760 (array!77732 (store (arr!37510 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38046 _keys!1208)))))

(declare-fun b!1199415 () Bool)

(declare-fun res!798341 () Bool)

(assert (=> b!1199415 (=> (not res!798341) (not e!681230))))

(assert (=> b!1199415 (= res!798341 (= (select (arr!37510 _keys!1208) i!673) k0!934))))

(declare-fun b!1199416 () Bool)

(declare-fun res!798333 () Bool)

(assert (=> b!1199416 (=> (not res!798333) (not e!681230))))

(assert (=> b!1199416 (= res!798333 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38046 _keys!1208))))))

(declare-fun b!1199417 () Bool)

(declare-fun res!798340 () Bool)

(assert (=> b!1199417 (=> (not res!798340) (not e!681233))))

(declare-datatypes ((List!26395 0))(
  ( (Nil!26392) (Cons!26391 (h!27600 (_ BitVec 64)) (t!39148 List!26395)) )
))
(declare-fun arrayNoDuplicates!0 (array!77731 (_ BitVec 32) List!26395) Bool)

(assert (=> b!1199417 (= res!798340 (arrayNoDuplicates!0 lt!543760 #b00000000000000000000000000000000 Nil!26392))))

(declare-fun mapIsEmpty!47558 () Bool)

(assert (=> mapIsEmpty!47558 mapRes!47558))

(declare-fun res!798335 () Bool)

(assert (=> start!100450 (=> (not res!798335) (not e!681230))))

(assert (=> start!100450 (= res!798335 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38046 _keys!1208))))))

(assert (=> start!100450 e!681230))

(assert (=> start!100450 tp_is_empty!30477))

(declare-fun array_inv!28580 (array!77731) Bool)

(assert (=> start!100450 (array_inv!28580 _keys!1208)))

(assert (=> start!100450 true))

(assert (=> start!100450 tp!90309))

(declare-fun array_inv!28581 (array!77729) Bool)

(assert (=> start!100450 (and (array_inv!28581 _values!996) e!681232)))

(declare-fun b!1199418 () Bool)

(declare-fun res!798334 () Bool)

(assert (=> b!1199418 (=> (not res!798334) (not e!681230))))

(assert (=> b!1199418 (= res!798334 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26392))))

(declare-fun b!1199419 () Bool)

(declare-fun res!798337 () Bool)

(assert (=> b!1199419 (=> (not res!798337) (not e!681230))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1199419 (= res!798337 (validMask!0 mask!1564))))

(declare-fun b!1199420 () Bool)

(declare-fun res!798336 () Bool)

(assert (=> b!1199420 (=> (not res!798336) (not e!681230))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1199420 (= res!798336 (validKeyInArray!0 k0!934))))

(declare-fun b!1199421 () Bool)

(declare-fun res!798342 () Bool)

(assert (=> b!1199421 (=> (not res!798342) (not e!681230))))

(assert (=> b!1199421 (= res!798342 (and (= (size!38045 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38046 _keys!1208) (size!38045 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!100450 res!798335) b!1199419))

(assert (= (and b!1199419 res!798337) b!1199421))

(assert (= (and b!1199421 res!798342) b!1199412))

(assert (= (and b!1199412 res!798339) b!1199418))

(assert (= (and b!1199418 res!798334) b!1199416))

(assert (= (and b!1199416 res!798333) b!1199420))

(assert (= (and b!1199420 res!798336) b!1199415))

(assert (= (and b!1199415 res!798341) b!1199414))

(assert (= (and b!1199414 res!798332) b!1199417))

(assert (= (and b!1199417 res!798340) b!1199410))

(assert (= (and b!1199410 (not res!798338)) b!1199408))

(assert (= (and b!1199409 condMapEmpty!47558) mapIsEmpty!47558))

(assert (= (and b!1199409 (not condMapEmpty!47558)) mapNonEmpty!47558))

(get-info :version)

(assert (= (and mapNonEmpty!47558 ((_ is ValueCellFull!14529) mapValue!47558)) b!1199413))

(assert (= (and b!1199409 ((_ is ValueCellFull!14529) mapDefault!47558)) b!1199411))

(assert (= start!100450 b!1199409))

(declare-fun b_lambda!20969 () Bool)

(assert (=> (not b_lambda!20969) (not b!1199408)))

(declare-fun t!39146 () Bool)

(declare-fun tb!10573 () Bool)

(assert (=> (and start!100450 (= defaultEntry!1004 defaultEntry!1004) t!39146) tb!10573))

(declare-fun result!21723 () Bool)

(assert (=> tb!10573 (= result!21723 tp_is_empty!30477)))

(assert (=> b!1199408 t!39146))

(declare-fun b_and!42435 () Bool)

(assert (= b_and!42433 (and (=> t!39146 result!21723) b_and!42435)))

(declare-fun m!1105953 () Bool)

(assert (=> b!1199419 m!1105953))

(declare-fun m!1105955 () Bool)

(assert (=> b!1199412 m!1105955))

(declare-fun m!1105957 () Bool)

(assert (=> b!1199410 m!1105957))

(declare-fun m!1105959 () Bool)

(assert (=> b!1199410 m!1105959))

(declare-fun m!1105961 () Bool)

(assert (=> b!1199415 m!1105961))

(declare-fun m!1105963 () Bool)

(assert (=> b!1199417 m!1105963))

(declare-fun m!1105965 () Bool)

(assert (=> start!100450 m!1105965))

(declare-fun m!1105967 () Bool)

(assert (=> start!100450 m!1105967))

(declare-fun m!1105969 () Bool)

(assert (=> mapNonEmpty!47558 m!1105969))

(declare-fun m!1105971 () Bool)

(assert (=> b!1199418 m!1105971))

(declare-fun m!1105973 () Bool)

(assert (=> b!1199420 m!1105973))

(declare-fun m!1105975 () Bool)

(assert (=> b!1199408 m!1105975))

(declare-fun m!1105977 () Bool)

(assert (=> b!1199408 m!1105977))

(declare-fun m!1105979 () Bool)

(assert (=> b!1199408 m!1105979))

(declare-fun m!1105981 () Bool)

(assert (=> b!1199408 m!1105981))

(declare-fun m!1105983 () Bool)

(assert (=> b!1199414 m!1105983))

(declare-fun m!1105985 () Bool)

(assert (=> b!1199414 m!1105985))

(check-sat (not mapNonEmpty!47558) (not b!1199418) (not b!1199417) (not b!1199420) (not b!1199414) (not b_next!25773) (not start!100450) (not b!1199410) (not b!1199408) b_and!42435 (not b!1199412) (not b_lambda!20969) tp_is_empty!30477 (not b!1199419))
(check-sat b_and!42435 (not b_next!25773))
