; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84072 () Bool)

(assert start!84072)

(declare-fun b_free!19827 () Bool)

(declare-fun b_next!19827 () Bool)

(assert (=> start!84072 (= b_free!19827 (not b_next!19827))))

(declare-fun tp!69003 () Bool)

(declare-fun b_and!31737 () Bool)

(assert (=> start!84072 (= tp!69003 b_and!31737)))

(declare-fun res!657839 () Bool)

(declare-fun e!554090 () Bool)

(assert (=> start!84072 (=> (not res!657839) (not e!554090))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84072 (= res!657839 (validMask!0 mask!1948))))

(assert (=> start!84072 e!554090))

(assert (=> start!84072 true))

(declare-fun tp_is_empty!22875 () Bool)

(assert (=> start!84072 tp_is_empty!22875))

(declare-datatypes ((V!35483 0))(
  ( (V!35484 (val!11488 Int)) )
))
(declare-datatypes ((ValueCell!10956 0))(
  ( (ValueCellFull!10956 (v!14050 V!35483)) (EmptyCell!10956) )
))
(declare-datatypes ((array!61739 0))(
  ( (array!61740 (arr!29727 (Array (_ BitVec 32) ValueCell!10956)) (size!30206 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61739)

(declare-fun e!554091 () Bool)

(declare-fun array_inv!22989 (array!61739) Bool)

(assert (=> start!84072 (and (array_inv!22989 _values!1278) e!554091)))

(assert (=> start!84072 tp!69003))

(declare-datatypes ((array!61741 0))(
  ( (array!61742 (arr!29728 (Array (_ BitVec 32) (_ BitVec 64))) (size!30207 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61741)

(declare-fun array_inv!22990 (array!61741) Bool)

(assert (=> start!84072 (array_inv!22990 _keys!1544)))

(declare-fun mapIsEmpty!36341 () Bool)

(declare-fun mapRes!36341 () Bool)

(assert (=> mapIsEmpty!36341 mapRes!36341))

(declare-fun b!983014 () Bool)

(declare-fun e!554093 () Bool)

(assert (=> b!983014 (= e!554093 tp_is_empty!22875)))

(declare-fun b!983015 () Bool)

(declare-fun res!657841 () Bool)

(assert (=> b!983015 (=> (not res!657841) (not e!554090))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61741 (_ BitVec 32)) Bool)

(assert (=> b!983015 (= res!657841 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!983016 () Bool)

(declare-fun res!657837 () Bool)

(assert (=> b!983016 (=> (not res!657837) (not e!554090))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!983016 (= res!657837 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!36341 () Bool)

(declare-fun tp!69004 () Bool)

(declare-fun e!554089 () Bool)

(assert (=> mapNonEmpty!36341 (= mapRes!36341 (and tp!69004 e!554089))))

(declare-fun mapValue!36341 () ValueCell!10956)

(declare-fun mapKey!36341 () (_ BitVec 32))

(declare-fun mapRest!36341 () (Array (_ BitVec 32) ValueCell!10956))

(assert (=> mapNonEmpty!36341 (= (arr!29727 _values!1278) (store mapRest!36341 mapKey!36341 mapValue!36341))))

(declare-fun b!983017 () Bool)

(assert (=> b!983017 (= e!554089 tp_is_empty!22875)))

(declare-fun b!983018 () Bool)

(assert (=> b!983018 (= e!554091 (and e!554093 mapRes!36341))))

(declare-fun condMapEmpty!36341 () Bool)

(declare-fun mapDefault!36341 () ValueCell!10956)

(assert (=> b!983018 (= condMapEmpty!36341 (= (arr!29727 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10956)) mapDefault!36341)))))

(declare-fun b!983019 () Bool)

(declare-fun res!657835 () Bool)

(assert (=> b!983019 (=> (not res!657835) (not e!554090))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!983019 (= res!657835 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30207 _keys!1544))))))

(declare-fun b!983020 () Bool)

(declare-fun e!554092 () Bool)

(assert (=> b!983020 (= e!554092 (not true))))

(declare-datatypes ((tuple2!14720 0))(
  ( (tuple2!14721 (_1!7371 (_ BitVec 64)) (_2!7371 V!35483)) )
))
(declare-datatypes ((List!20597 0))(
  ( (Nil!20594) (Cons!20593 (h!21755 tuple2!14720) (t!29374 List!20597)) )
))
(declare-datatypes ((ListLongMap!13417 0))(
  ( (ListLongMap!13418 (toList!6724 List!20597)) )
))
(declare-fun lt!436384 () ListLongMap!13417)

(declare-fun lt!436381 () tuple2!14720)

(declare-fun lt!436385 () tuple2!14720)

(declare-fun +!3021 (ListLongMap!13417 tuple2!14720) ListLongMap!13417)

(assert (=> b!983020 (= (+!3021 (+!3021 lt!436384 lt!436381) lt!436385) (+!3021 (+!3021 lt!436384 lt!436385) lt!436381))))

(declare-fun lt!436382 () V!35483)

(assert (=> b!983020 (= lt!436385 (tuple2!14721 (select (arr!29728 _keys!1544) from!1932) lt!436382))))

(declare-fun zeroValue!1220 () V!35483)

(assert (=> b!983020 (= lt!436381 (tuple2!14721 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32681 0))(
  ( (Unit!32682) )
))
(declare-fun lt!436383 () Unit!32681)

(declare-fun addCommutativeForDiffKeys!649 (ListLongMap!13417 (_ BitVec 64) V!35483 (_ BitVec 64) V!35483) Unit!32681)

(assert (=> b!983020 (= lt!436383 (addCommutativeForDiffKeys!649 lt!436384 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29728 _keys!1544) from!1932) lt!436382))))

(declare-fun b!983021 () Bool)

(declare-fun res!657842 () Bool)

(assert (=> b!983021 (=> (not res!657842) (not e!554090))))

(assert (=> b!983021 (= res!657842 (and (= (size!30206 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30207 _keys!1544) (size!30206 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!983022 () Bool)

(declare-fun res!657840 () Bool)

(assert (=> b!983022 (=> (not res!657840) (not e!554090))))

(declare-datatypes ((List!20598 0))(
  ( (Nil!20595) (Cons!20594 (h!21756 (_ BitVec 64)) (t!29375 List!20598)) )
))
(declare-fun arrayNoDuplicates!0 (array!61741 (_ BitVec 32) List!20598) Bool)

(assert (=> b!983022 (= res!657840 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20595))))

(declare-fun b!983023 () Bool)

(assert (=> b!983023 (= e!554090 e!554092)))

(declare-fun res!657838 () Bool)

(assert (=> b!983023 (=> (not res!657838) (not e!554092))))

(assert (=> b!983023 (= res!657838 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29728 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15422 (ValueCell!10956 V!35483) V!35483)

(declare-fun dynLambda!1803 (Int (_ BitVec 64)) V!35483)

(assert (=> b!983023 (= lt!436382 (get!15422 (select (arr!29727 _values!1278) from!1932) (dynLambda!1803 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35483)

(declare-fun getCurrentListMapNoExtraKeys!3420 (array!61741 array!61739 (_ BitVec 32) (_ BitVec 32) V!35483 V!35483 (_ BitVec 32) Int) ListLongMap!13417)

(assert (=> b!983023 (= lt!436384 (getCurrentListMapNoExtraKeys!3420 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!983024 () Bool)

(declare-fun res!657836 () Bool)

(assert (=> b!983024 (=> (not res!657836) (not e!554090))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!983024 (= res!657836 (validKeyInArray!0 (select (arr!29728 _keys!1544) from!1932)))))

(assert (= (and start!84072 res!657839) b!983021))

(assert (= (and b!983021 res!657842) b!983015))

(assert (= (and b!983015 res!657841) b!983022))

(assert (= (and b!983022 res!657840) b!983019))

(assert (= (and b!983019 res!657835) b!983024))

(assert (= (and b!983024 res!657836) b!983016))

(assert (= (and b!983016 res!657837) b!983023))

(assert (= (and b!983023 res!657838) b!983020))

(assert (= (and b!983018 condMapEmpty!36341) mapIsEmpty!36341))

(assert (= (and b!983018 (not condMapEmpty!36341)) mapNonEmpty!36341))

(get-info :version)

(assert (= (and mapNonEmpty!36341 ((_ is ValueCellFull!10956) mapValue!36341)) b!983017))

(assert (= (and b!983018 ((_ is ValueCellFull!10956) mapDefault!36341)) b!983014))

(assert (= start!84072 b!983018))

(declare-fun b_lambda!14865 () Bool)

(assert (=> (not b_lambda!14865) (not b!983023)))

(declare-fun t!29373 () Bool)

(declare-fun tb!6627 () Bool)

(assert (=> (and start!84072 (= defaultEntry!1281 defaultEntry!1281) t!29373) tb!6627))

(declare-fun result!13243 () Bool)

(assert (=> tb!6627 (= result!13243 tp_is_empty!22875)))

(assert (=> b!983023 t!29373))

(declare-fun b_and!31739 () Bool)

(assert (= b_and!31737 (and (=> t!29373 result!13243) b_and!31739)))

(declare-fun m!910337 () Bool)

(assert (=> b!983023 m!910337))

(declare-fun m!910339 () Bool)

(assert (=> b!983023 m!910339))

(declare-fun m!910341 () Bool)

(assert (=> b!983023 m!910341))

(declare-fun m!910343 () Bool)

(assert (=> b!983023 m!910343))

(assert (=> b!983023 m!910339))

(assert (=> b!983023 m!910343))

(declare-fun m!910345 () Bool)

(assert (=> b!983023 m!910345))

(declare-fun m!910347 () Bool)

(assert (=> mapNonEmpty!36341 m!910347))

(declare-fun m!910349 () Bool)

(assert (=> b!983020 m!910349))

(assert (=> b!983020 m!910337))

(declare-fun m!910351 () Bool)

(assert (=> b!983020 m!910351))

(assert (=> b!983020 m!910349))

(declare-fun m!910353 () Bool)

(assert (=> b!983020 m!910353))

(declare-fun m!910355 () Bool)

(assert (=> b!983020 m!910355))

(assert (=> b!983020 m!910337))

(assert (=> b!983020 m!910355))

(declare-fun m!910357 () Bool)

(assert (=> b!983020 m!910357))

(declare-fun m!910359 () Bool)

(assert (=> b!983015 m!910359))

(assert (=> b!983024 m!910337))

(assert (=> b!983024 m!910337))

(declare-fun m!910361 () Bool)

(assert (=> b!983024 m!910361))

(declare-fun m!910363 () Bool)

(assert (=> b!983022 m!910363))

(declare-fun m!910365 () Bool)

(assert (=> start!84072 m!910365))

(declare-fun m!910367 () Bool)

(assert (=> start!84072 m!910367))

(declare-fun m!910369 () Bool)

(assert (=> start!84072 m!910369))

(check-sat (not b_lambda!14865) (not b!983024) (not start!84072) (not mapNonEmpty!36341) (not b_next!19827) (not b!983020) (not b!983023) (not b!983022) tp_is_empty!22875 b_and!31739 (not b!983015))
(check-sat b_and!31739 (not b_next!19827))
