; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84202 () Bool)

(assert start!84202)

(declare-fun b_free!19921 () Bool)

(declare-fun b_next!19921 () Bool)

(assert (=> start!84202 (= b_free!19921 (not b_next!19921))))

(declare-fun tp!69368 () Bool)

(declare-fun b_and!31893 () Bool)

(assert (=> start!84202 (= tp!69368 b_and!31893)))

(declare-fun b!984918 () Bool)

(declare-fun res!659117 () Bool)

(declare-fun e!555185 () Bool)

(assert (=> b!984918 (=> (not res!659117) (not e!555185))))

(declare-datatypes ((array!61952 0))(
  ( (array!61953 (arr!29834 (Array (_ BitVec 32) (_ BitVec 64))) (size!30315 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61952)

(declare-datatypes ((List!20723 0))(
  ( (Nil!20720) (Cons!20719 (h!21881 (_ BitVec 64)) (t!29579 List!20723)) )
))
(declare-fun arrayNoDuplicates!0 (array!61952 (_ BitVec 32) List!20723) Bool)

(assert (=> b!984918 (= res!659117 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20720))))

(declare-fun b!984919 () Bool)

(declare-fun e!555188 () Bool)

(declare-fun tp_is_empty!23023 () Bool)

(assert (=> b!984919 (= e!555188 tp_is_empty!23023)))

(declare-fun mapIsEmpty!36563 () Bool)

(declare-fun mapRes!36563 () Bool)

(assert (=> mapIsEmpty!36563 mapRes!36563))

(declare-fun res!659121 () Bool)

(assert (=> start!84202 (=> (not res!659121) (not e!555185))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84202 (= res!659121 (validMask!0 mask!1948))))

(assert (=> start!84202 e!555185))

(assert (=> start!84202 true))

(assert (=> start!84202 tp_is_empty!23023))

(declare-datatypes ((V!35681 0))(
  ( (V!35682 (val!11562 Int)) )
))
(declare-datatypes ((ValueCell!11030 0))(
  ( (ValueCellFull!11030 (v!14123 V!35681)) (EmptyCell!11030) )
))
(declare-datatypes ((array!61954 0))(
  ( (array!61955 (arr!29835 (Array (_ BitVec 32) ValueCell!11030)) (size!30316 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61954)

(declare-fun e!555183 () Bool)

(declare-fun array_inv!23067 (array!61954) Bool)

(assert (=> start!84202 (and (array_inv!23067 _values!1278) e!555183)))

(assert (=> start!84202 tp!69368))

(declare-fun array_inv!23068 (array!61952) Bool)

(assert (=> start!84202 (array_inv!23068 _keys!1544)))

(declare-fun b!984920 () Bool)

(declare-fun e!555186 () Bool)

(assert (=> b!984920 (= e!555185 e!555186)))

(declare-fun res!659114 () Bool)

(assert (=> b!984920 (=> (not res!659114) (not e!555186))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!984920 (= res!659114 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29834 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun lt!436887 () V!35681)

(declare-fun get!15503 (ValueCell!11030 V!35681) V!35681)

(declare-fun dynLambda!1829 (Int (_ BitVec 64)) V!35681)

(assert (=> b!984920 (= lt!436887 (get!15503 (select (arr!29835 _values!1278) from!1932) (dynLambda!1829 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((tuple2!14874 0))(
  ( (tuple2!14875 (_1!7448 (_ BitVec 64)) (_2!7448 V!35681)) )
))
(declare-datatypes ((List!20724 0))(
  ( (Nil!20721) (Cons!20720 (h!21882 tuple2!14874) (t!29580 List!20724)) )
))
(declare-datatypes ((ListLongMap!13561 0))(
  ( (ListLongMap!13562 (toList!6796 List!20724)) )
))
(declare-fun lt!436886 () ListLongMap!13561)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35681)

(declare-fun minValue!1220 () V!35681)

(declare-fun getCurrentListMapNoExtraKeys!3501 (array!61952 array!61954 (_ BitVec 32) (_ BitVec 32) V!35681 V!35681 (_ BitVec 32) Int) ListLongMap!13561)

(assert (=> b!984920 (= lt!436886 (getCurrentListMapNoExtraKeys!3501 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!984921 () Bool)

(assert (=> b!984921 (= e!555183 (and e!555188 mapRes!36563))))

(declare-fun condMapEmpty!36563 () Bool)

(declare-fun mapDefault!36563 () ValueCell!11030)

(assert (=> b!984921 (= condMapEmpty!36563 (= (arr!29835 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11030)) mapDefault!36563)))))

(declare-fun b!984922 () Bool)

(declare-fun res!659116 () Bool)

(assert (=> b!984922 (=> (not res!659116) (not e!555185))))

(assert (=> b!984922 (= res!659116 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30315 _keys!1544))))))

(declare-fun b!984923 () Bool)

(declare-fun res!659119 () Bool)

(assert (=> b!984923 (=> (not res!659119) (not e!555185))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!984923 (= res!659119 (validKeyInArray!0 (select (arr!29834 _keys!1544) from!1932)))))

(declare-fun b!984924 () Bool)

(declare-fun res!659118 () Bool)

(assert (=> b!984924 (=> (not res!659118) (not e!555185))))

(assert (=> b!984924 (= res!659118 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!984925 () Bool)

(declare-fun res!659115 () Bool)

(assert (=> b!984925 (=> (not res!659115) (not e!555185))))

(assert (=> b!984925 (= res!659115 (and (= (size!30316 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30315 _keys!1544) (size!30316 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!984926 () Bool)

(declare-fun e!555184 () Bool)

(assert (=> b!984926 (= e!555184 tp_is_empty!23023)))

(declare-fun b!984927 () Bool)

(declare-fun res!659120 () Bool)

(assert (=> b!984927 (=> (not res!659120) (not e!555185))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61952 (_ BitVec 32)) Bool)

(assert (=> b!984927 (= res!659120 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapNonEmpty!36563 () Bool)

(declare-fun tp!69367 () Bool)

(assert (=> mapNonEmpty!36563 (= mapRes!36563 (and tp!69367 e!555184))))

(declare-fun mapKey!36563 () (_ BitVec 32))

(declare-fun mapRest!36563 () (Array (_ BitVec 32) ValueCell!11030))

(declare-fun mapValue!36563 () ValueCell!11030)

(assert (=> mapNonEmpty!36563 (= (arr!29835 _values!1278) (store mapRest!36563 mapKey!36563 mapValue!36563))))

(declare-fun b!984928 () Bool)

(assert (=> b!984928 (= e!555186 (not true))))

(declare-fun lt!436889 () tuple2!14874)

(declare-fun lt!436888 () tuple2!14874)

(declare-fun +!3074 (ListLongMap!13561 tuple2!14874) ListLongMap!13561)

(assert (=> b!984928 (= (+!3074 (+!3074 lt!436886 lt!436889) lt!436888) (+!3074 (+!3074 lt!436886 lt!436888) lt!436889))))

(assert (=> b!984928 (= lt!436888 (tuple2!14875 (select (arr!29834 _keys!1544) from!1932) lt!436887))))

(assert (=> b!984928 (= lt!436889 (tuple2!14875 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32614 0))(
  ( (Unit!32615) )
))
(declare-fun lt!436890 () Unit!32614)

(declare-fun addCommutativeForDiffKeys!678 (ListLongMap!13561 (_ BitVec 64) V!35681 (_ BitVec 64) V!35681) Unit!32614)

(assert (=> b!984928 (= lt!436890 (addCommutativeForDiffKeys!678 lt!436886 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29834 _keys!1544) from!1932) lt!436887))))

(assert (= (and start!84202 res!659121) b!984925))

(assert (= (and b!984925 res!659115) b!984927))

(assert (= (and b!984927 res!659120) b!984918))

(assert (= (and b!984918 res!659117) b!984922))

(assert (= (and b!984922 res!659116) b!984923))

(assert (= (and b!984923 res!659119) b!984924))

(assert (= (and b!984924 res!659118) b!984920))

(assert (= (and b!984920 res!659114) b!984928))

(assert (= (and b!984921 condMapEmpty!36563) mapIsEmpty!36563))

(assert (= (and b!984921 (not condMapEmpty!36563)) mapNonEmpty!36563))

(get-info :version)

(assert (= (and mapNonEmpty!36563 ((_ is ValueCellFull!11030) mapValue!36563)) b!984926))

(assert (= (and b!984921 ((_ is ValueCellFull!11030) mapDefault!36563)) b!984919))

(assert (= start!84202 b!984921))

(declare-fun b_lambda!14935 () Bool)

(assert (=> (not b_lambda!14935) (not b!984920)))

(declare-fun t!29578 () Bool)

(declare-fun tb!6707 () Bool)

(assert (=> (and start!84202 (= defaultEntry!1281 defaultEntry!1281) t!29578) tb!6707))

(declare-fun result!13411 () Bool)

(assert (=> tb!6707 (= result!13411 tp_is_empty!23023)))

(assert (=> b!984920 t!29578))

(declare-fun b_and!31895 () Bool)

(assert (= b_and!31893 (and (=> t!29578 result!13411) b_and!31895)))

(declare-fun m!911465 () Bool)

(assert (=> start!84202 m!911465))

(declare-fun m!911467 () Bool)

(assert (=> start!84202 m!911467))

(declare-fun m!911469 () Bool)

(assert (=> start!84202 m!911469))

(declare-fun m!911471 () Bool)

(assert (=> b!984928 m!911471))

(declare-fun m!911473 () Bool)

(assert (=> b!984928 m!911473))

(declare-fun m!911475 () Bool)

(assert (=> b!984928 m!911475))

(assert (=> b!984928 m!911471))

(declare-fun m!911477 () Bool)

(assert (=> b!984928 m!911477))

(declare-fun m!911479 () Bool)

(assert (=> b!984928 m!911479))

(assert (=> b!984928 m!911473))

(assert (=> b!984928 m!911479))

(declare-fun m!911481 () Bool)

(assert (=> b!984928 m!911481))

(declare-fun m!911483 () Bool)

(assert (=> b!984918 m!911483))

(declare-fun m!911485 () Bool)

(assert (=> mapNonEmpty!36563 m!911485))

(assert (=> b!984920 m!911471))

(declare-fun m!911487 () Bool)

(assert (=> b!984920 m!911487))

(declare-fun m!911489 () Bool)

(assert (=> b!984920 m!911489))

(declare-fun m!911491 () Bool)

(assert (=> b!984920 m!911491))

(assert (=> b!984920 m!911487))

(assert (=> b!984920 m!911491))

(declare-fun m!911493 () Bool)

(assert (=> b!984920 m!911493))

(declare-fun m!911495 () Bool)

(assert (=> b!984927 m!911495))

(assert (=> b!984923 m!911471))

(assert (=> b!984923 m!911471))

(declare-fun m!911497 () Bool)

(assert (=> b!984923 m!911497))

(check-sat b_and!31895 (not b!984923) (not b!984928) (not mapNonEmpty!36563) (not b!984920) (not b!984918) (not b!984927) (not b_lambda!14935) (not b_next!19921) tp_is_empty!23023 (not start!84202))
(check-sat b_and!31895 (not b_next!19921))
