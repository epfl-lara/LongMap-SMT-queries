; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102002 () Bool)

(assert start!102002)

(declare-fun b_free!26455 () Bool)

(declare-fun b_next!26455 () Bool)

(assert (=> start!102002 (= b_free!26455 (not b_next!26455))))

(declare-fun tp!92410 () Bool)

(declare-fun b_and!44173 () Bool)

(assert (=> start!102002 (= tp!92410 b_and!44173)))

(declare-fun res!814948 () Bool)

(declare-fun e!696906 () Bool)

(assert (=> start!102002 (=> (not res!814948) (not e!696906))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!79139 0))(
  ( (array!79140 (arr!38190 (Array (_ BitVec 32) (_ BitVec 64))) (size!38727 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!79139)

(assert (=> start!102002 (= res!814948 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38727 _keys!1208))))))

(assert (=> start!102002 e!696906))

(declare-fun tp_is_empty!31159 () Bool)

(assert (=> start!102002 tp_is_empty!31159))

(declare-fun array_inv!29136 (array!79139) Bool)

(assert (=> start!102002 (array_inv!29136 _keys!1208)))

(assert (=> start!102002 true))

(assert (=> start!102002 tp!92410))

(declare-datatypes ((V!46673 0))(
  ( (V!46674 (val!15636 Int)) )
))
(declare-datatypes ((ValueCell!14870 0))(
  ( (ValueCellFull!14870 (v!18294 V!46673)) (EmptyCell!14870) )
))
(declare-datatypes ((array!79141 0))(
  ( (array!79142 (arr!38191 (Array (_ BitVec 32) ValueCell!14870)) (size!38728 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!79141)

(declare-fun e!696901 () Bool)

(declare-fun array_inv!29137 (array!79141) Bool)

(assert (=> start!102002 (and (array_inv!29137 _values!996) e!696901)))

(declare-fun b!1226844 () Bool)

(declare-fun res!814953 () Bool)

(assert (=> b!1226844 (=> (not res!814953) (not e!696906))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1226844 (= res!814953 (= (select (arr!38190 _keys!1208) i!673) k0!934))))

(declare-fun b!1226845 () Bool)

(declare-fun res!814949 () Bool)

(assert (=> b!1226845 (=> (not res!814949) (not e!696906))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!79139 (_ BitVec 32)) Bool)

(assert (=> b!1226845 (= res!814949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1226846 () Bool)

(declare-fun res!814959 () Bool)

(declare-fun e!696904 () Bool)

(assert (=> b!1226846 (=> (not res!814959) (not e!696904))))

(declare-fun lt!558970 () array!79139)

(declare-datatypes ((List!26985 0))(
  ( (Nil!26982) (Cons!26981 (h!28199 (_ BitVec 64)) (t!40412 List!26985)) )
))
(declare-fun arrayNoDuplicates!0 (array!79139 (_ BitVec 32) List!26985) Bool)

(assert (=> b!1226846 (= res!814959 (arrayNoDuplicates!0 lt!558970 #b00000000000000000000000000000000 Nil!26982))))

(declare-fun b!1226847 () Bool)

(declare-fun res!814952 () Bool)

(assert (=> b!1226847 (=> (not res!814952) (not e!696906))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1226847 (= res!814952 (and (= (size!38728 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38727 _keys!1208) (size!38728 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!48637 () Bool)

(declare-fun mapRes!48637 () Bool)

(assert (=> mapIsEmpty!48637 mapRes!48637))

(declare-fun b!1226848 () Bool)

(declare-fun res!814956 () Bool)

(assert (=> b!1226848 (=> (not res!814956) (not e!696906))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1226848 (= res!814956 (validMask!0 mask!1564))))

(declare-fun b!1226849 () Bool)

(declare-fun res!814950 () Bool)

(assert (=> b!1226849 (=> (not res!814950) (not e!696906))))

(assert (=> b!1226849 (= res!814950 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38727 _keys!1208))))))

(declare-fun b!1226850 () Bool)

(declare-fun e!696905 () Bool)

(assert (=> b!1226850 (= e!696905 true)))

(declare-fun zeroValue!944 () V!46673)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46673)

(declare-fun lt!558973 () array!79141)

(declare-datatypes ((tuple2!20174 0))(
  ( (tuple2!20175 (_1!10098 (_ BitVec 64)) (_2!10098 V!46673)) )
))
(declare-datatypes ((List!26986 0))(
  ( (Nil!26983) (Cons!26982 (h!28200 tuple2!20174) (t!40413 List!26986)) )
))
(declare-datatypes ((ListLongMap!18151 0))(
  ( (ListLongMap!18152 (toList!9091 List!26986)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5538 (array!79139 array!79141 (_ BitVec 32) (_ BitVec 32) V!46673 V!46673 (_ BitVec 32) Int) ListLongMap!18151)

(declare-fun -!1962 (ListLongMap!18151 (_ BitVec 64)) ListLongMap!18151)

(assert (=> b!1226850 (= (getCurrentListMapNoExtraKeys!5538 lt!558970 lt!558973 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1962 (getCurrentListMapNoExtraKeys!5538 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!40597 0))(
  ( (Unit!40598) )
))
(declare-fun lt!558972 () Unit!40597)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1177 (array!79139 array!79141 (_ BitVec 32) (_ BitVec 32) V!46673 V!46673 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40597)

(assert (=> b!1226850 (= lt!558972 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1177 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1226851 () Bool)

(assert (=> b!1226851 (= e!696906 e!696904)))

(declare-fun res!814954 () Bool)

(assert (=> b!1226851 (=> (not res!814954) (not e!696904))))

(assert (=> b!1226851 (= res!814954 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!558970 mask!1564))))

(assert (=> b!1226851 (= lt!558970 (array!79140 (store (arr!38190 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38727 _keys!1208)))))

(declare-fun b!1226852 () Bool)

(declare-fun e!696907 () Bool)

(assert (=> b!1226852 (= e!696907 tp_is_empty!31159)))

(declare-fun b!1226853 () Bool)

(declare-fun e!696903 () Bool)

(assert (=> b!1226853 (= e!696903 tp_is_empty!31159)))

(declare-fun mapNonEmpty!48637 () Bool)

(declare-fun tp!92411 () Bool)

(assert (=> mapNonEmpty!48637 (= mapRes!48637 (and tp!92411 e!696903))))

(declare-fun mapValue!48637 () ValueCell!14870)

(declare-fun mapRest!48637 () (Array (_ BitVec 32) ValueCell!14870))

(declare-fun mapKey!48637 () (_ BitVec 32))

(assert (=> mapNonEmpty!48637 (= (arr!38191 _values!996) (store mapRest!48637 mapKey!48637 mapValue!48637))))

(declare-fun b!1226854 () Bool)

(declare-fun res!814958 () Bool)

(assert (=> b!1226854 (=> (not res!814958) (not e!696906))))

(assert (=> b!1226854 (= res!814958 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26982))))

(declare-fun b!1226855 () Bool)

(declare-fun res!814955 () Bool)

(assert (=> b!1226855 (=> (not res!814955) (not e!696906))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1226855 (= res!814955 (validKeyInArray!0 k0!934))))

(declare-fun b!1226856 () Bool)

(declare-fun e!696900 () Bool)

(assert (=> b!1226856 (= e!696904 (not e!696900))))

(declare-fun res!814957 () Bool)

(assert (=> b!1226856 (=> res!814957 e!696900)))

(assert (=> b!1226856 (= res!814957 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!79139 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1226856 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!558969 () Unit!40597)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!79139 (_ BitVec 64) (_ BitVec 32)) Unit!40597)

(assert (=> b!1226856 (= lt!558969 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1226857 () Bool)

(assert (=> b!1226857 (= e!696901 (and e!696907 mapRes!48637))))

(declare-fun condMapEmpty!48637 () Bool)

(declare-fun mapDefault!48637 () ValueCell!14870)

(assert (=> b!1226857 (= condMapEmpty!48637 (= (arr!38191 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14870)) mapDefault!48637)))))

(declare-fun b!1226858 () Bool)

(assert (=> b!1226858 (= e!696900 e!696905)))

(declare-fun res!814951 () Bool)

(assert (=> b!1226858 (=> res!814951 e!696905)))

(assert (=> b!1226858 (= res!814951 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!558971 () ListLongMap!18151)

(assert (=> b!1226858 (= lt!558971 (getCurrentListMapNoExtraKeys!5538 lt!558970 lt!558973 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3432 (Int (_ BitVec 64)) V!46673)

(assert (=> b!1226858 (= lt!558973 (array!79142 (store (arr!38191 _values!996) i!673 (ValueCellFull!14870 (dynLambda!3432 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38728 _values!996)))))

(declare-fun lt!558974 () ListLongMap!18151)

(assert (=> b!1226858 (= lt!558974 (getCurrentListMapNoExtraKeys!5538 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!102002 res!814948) b!1226848))

(assert (= (and b!1226848 res!814956) b!1226847))

(assert (= (and b!1226847 res!814952) b!1226845))

(assert (= (and b!1226845 res!814949) b!1226854))

(assert (= (and b!1226854 res!814958) b!1226849))

(assert (= (and b!1226849 res!814950) b!1226855))

(assert (= (and b!1226855 res!814955) b!1226844))

(assert (= (and b!1226844 res!814953) b!1226851))

(assert (= (and b!1226851 res!814954) b!1226846))

(assert (= (and b!1226846 res!814959) b!1226856))

(assert (= (and b!1226856 (not res!814957)) b!1226858))

(assert (= (and b!1226858 (not res!814951)) b!1226850))

(assert (= (and b!1226857 condMapEmpty!48637) mapIsEmpty!48637))

(assert (= (and b!1226857 (not condMapEmpty!48637)) mapNonEmpty!48637))

(get-info :version)

(assert (= (and mapNonEmpty!48637 ((_ is ValueCellFull!14870) mapValue!48637)) b!1226853))

(assert (= (and b!1226857 ((_ is ValueCellFull!14870) mapDefault!48637)) b!1226852))

(assert (= start!102002 b!1226857))

(declare-fun b_lambda!22429 () Bool)

(assert (=> (not b_lambda!22429) (not b!1226858)))

(declare-fun t!40411 () Bool)

(declare-fun tb!11247 () Bool)

(assert (=> (and start!102002 (= defaultEntry!1004 defaultEntry!1004) t!40411) tb!11247))

(declare-fun result!23115 () Bool)

(assert (=> tb!11247 (= result!23115 tp_is_empty!31159)))

(assert (=> b!1226858 t!40411))

(declare-fun b_and!44175 () Bool)

(assert (= b_and!44173 (and (=> t!40411 result!23115) b_and!44175)))

(declare-fun m!1132283 () Bool)

(assert (=> b!1226850 m!1132283))

(declare-fun m!1132285 () Bool)

(assert (=> b!1226850 m!1132285))

(assert (=> b!1226850 m!1132285))

(declare-fun m!1132287 () Bool)

(assert (=> b!1226850 m!1132287))

(declare-fun m!1132289 () Bool)

(assert (=> b!1226850 m!1132289))

(declare-fun m!1132291 () Bool)

(assert (=> b!1226855 m!1132291))

(declare-fun m!1132293 () Bool)

(assert (=> b!1226845 m!1132293))

(declare-fun m!1132295 () Bool)

(assert (=> b!1226848 m!1132295))

(declare-fun m!1132297 () Bool)

(assert (=> mapNonEmpty!48637 m!1132297))

(declare-fun m!1132299 () Bool)

(assert (=> b!1226844 m!1132299))

(declare-fun m!1132301 () Bool)

(assert (=> b!1226854 m!1132301))

(declare-fun m!1132303 () Bool)

(assert (=> start!102002 m!1132303))

(declare-fun m!1132305 () Bool)

(assert (=> start!102002 m!1132305))

(declare-fun m!1132307 () Bool)

(assert (=> b!1226856 m!1132307))

(declare-fun m!1132309 () Bool)

(assert (=> b!1226856 m!1132309))

(declare-fun m!1132311 () Bool)

(assert (=> b!1226851 m!1132311))

(declare-fun m!1132313 () Bool)

(assert (=> b!1226851 m!1132313))

(declare-fun m!1132315 () Bool)

(assert (=> b!1226858 m!1132315))

(declare-fun m!1132317 () Bool)

(assert (=> b!1226858 m!1132317))

(declare-fun m!1132319 () Bool)

(assert (=> b!1226858 m!1132319))

(declare-fun m!1132321 () Bool)

(assert (=> b!1226858 m!1132321))

(declare-fun m!1132323 () Bool)

(assert (=> b!1226846 m!1132323))

(check-sat tp_is_empty!31159 (not b!1226858) b_and!44175 (not b!1226850) (not b!1226856) (not b!1226846) (not b!1226848) (not b!1226854) (not b!1226855) (not b_lambda!22429) (not mapNonEmpty!48637) (not b_next!26455) (not b!1226845) (not b!1226851) (not start!102002))
(check-sat b_and!44175 (not b_next!26455))
