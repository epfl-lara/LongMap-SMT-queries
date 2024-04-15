; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83824 () Bool)

(assert start!83824)

(declare-fun b_free!19651 () Bool)

(declare-fun b_next!19651 () Bool)

(assert (=> start!83824 (= b_free!19651 (not b_next!19651))))

(declare-fun tp!68396 () Bool)

(declare-fun b_and!31365 () Bool)

(assert (=> start!83824 (= tp!68396 b_and!31365)))

(declare-fun b!979197 () Bool)

(declare-fun e!551964 () Bool)

(declare-fun e!551966 () Bool)

(declare-fun mapRes!35996 () Bool)

(assert (=> b!979197 (= e!551964 (and e!551966 mapRes!35996))))

(declare-fun condMapEmpty!35996 () Bool)

(declare-datatypes ((V!35177 0))(
  ( (V!35178 (val!11373 Int)) )
))
(declare-datatypes ((ValueCell!10841 0))(
  ( (ValueCellFull!10841 (v!13934 V!35177)) (EmptyCell!10841) )
))
(declare-datatypes ((array!61232 0))(
  ( (array!61233 (arr!29474 (Array (_ BitVec 32) ValueCell!10841)) (size!29955 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61232)

(declare-fun mapDefault!35996 () ValueCell!10841)

(assert (=> b!979197 (= condMapEmpty!35996 (= (arr!29474 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10841)) mapDefault!35996)))))

(declare-fun b!979198 () Bool)

(declare-fun res!655359 () Bool)

(declare-fun e!551962 () Bool)

(assert (=> b!979198 (=> (not res!655359) (not e!551962))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!979198 (= res!655359 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!979199 () Bool)

(declare-fun e!551961 () Bool)

(declare-fun tp_is_empty!22645 () Bool)

(assert (=> b!979199 (= e!551961 tp_is_empty!22645)))

(declare-fun b!979200 () Bool)

(declare-fun res!655357 () Bool)

(assert (=> b!979200 (=> (not res!655357) (not e!551962))))

(declare-datatypes ((array!61234 0))(
  ( (array!61235 (arr!29475 (Array (_ BitVec 32) (_ BitVec 64))) (size!29956 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61234)

(declare-datatypes ((List!20477 0))(
  ( (Nil!20474) (Cons!20473 (h!21635 (_ BitVec 64)) (t!29075 List!20477)) )
))
(declare-fun arrayNoDuplicates!0 (array!61234 (_ BitVec 32) List!20477) Bool)

(assert (=> b!979200 (= res!655357 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20474))))

(declare-fun b!979201 () Bool)

(declare-fun res!655356 () Bool)

(assert (=> b!979201 (=> (not res!655356) (not e!551962))))

(declare-fun mask!1948 () (_ BitVec 32))

(assert (=> b!979201 (= res!655356 (and (= (size!29955 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29956 _keys!1544) (size!29955 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!979202 () Bool)

(declare-fun res!655353 () Bool)

(assert (=> b!979202 (=> (not res!655353) (not e!551962))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!979202 (= res!655353 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29956 _keys!1544))))))

(declare-fun b!979203 () Bool)

(declare-fun e!551963 () Bool)

(assert (=> b!979203 (= e!551962 (not e!551963))))

(declare-fun res!655355 () Bool)

(assert (=> b!979203 (=> res!655355 e!551963)))

(assert (=> b!979203 (= res!655355 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29475 _keys!1544) from!1932)))))

(declare-datatypes ((tuple2!14652 0))(
  ( (tuple2!14653 (_1!7337 (_ BitVec 64)) (_2!7337 V!35177)) )
))
(declare-fun lt!434223 () tuple2!14652)

(declare-datatypes ((List!20478 0))(
  ( (Nil!20475) (Cons!20474 (h!21636 tuple2!14652) (t!29076 List!20478)) )
))
(declare-datatypes ((ListLongMap!13339 0))(
  ( (ListLongMap!13340 (toList!6685 List!20478)) )
))
(declare-fun lt!434214 () ListLongMap!13339)

(declare-fun lt!434219 () ListLongMap!13339)

(declare-fun lt!434216 () tuple2!14652)

(declare-fun +!2985 (ListLongMap!13339 tuple2!14652) ListLongMap!13339)

(assert (=> b!979203 (= (+!2985 lt!434214 lt!434216) (+!2985 lt!434219 lt!434223))))

(declare-fun lt!434220 () ListLongMap!13339)

(assert (=> b!979203 (= lt!434219 (+!2985 lt!434220 lt!434216))))

(declare-fun lt!434217 () V!35177)

(assert (=> b!979203 (= lt!434216 (tuple2!14653 (select (arr!29475 _keys!1544) from!1932) lt!434217))))

(assert (=> b!979203 (= lt!434214 (+!2985 lt!434220 lt!434223))))

(declare-fun minValue!1220 () V!35177)

(assert (=> b!979203 (= lt!434223 (tuple2!14653 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32436 0))(
  ( (Unit!32437) )
))
(declare-fun lt!434222 () Unit!32436)

(declare-fun addCommutativeForDiffKeys!589 (ListLongMap!13339 (_ BitVec 64) V!35177 (_ BitVec 64) V!35177) Unit!32436)

(assert (=> b!979203 (= lt!434222 (addCommutativeForDiffKeys!589 lt!434220 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29475 _keys!1544) from!1932) lt!434217))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15283 (ValueCell!10841 V!35177) V!35177)

(declare-fun dynLambda!1735 (Int (_ BitVec 64)) V!35177)

(assert (=> b!979203 (= lt!434217 (get!15283 (select (arr!29474 _values!1278) from!1932) (dynLambda!1735 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!434221 () ListLongMap!13339)

(declare-fun lt!434215 () tuple2!14652)

(assert (=> b!979203 (= lt!434220 (+!2985 lt!434221 lt!434215))))

(declare-fun zeroValue!1220 () V!35177)

(assert (=> b!979203 (= lt!434215 (tuple2!14653 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun getCurrentListMapNoExtraKeys!3402 (array!61234 array!61232 (_ BitVec 32) (_ BitVec 32) V!35177 V!35177 (_ BitVec 32) Int) ListLongMap!13339)

(assert (=> b!979203 (= lt!434221 (getCurrentListMapNoExtraKeys!3402 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!979204 () Bool)

(declare-fun res!655352 () Bool)

(assert (=> b!979204 (=> (not res!655352) (not e!551962))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!979204 (= res!655352 (validKeyInArray!0 (select (arr!29475 _keys!1544) from!1932)))))

(declare-fun b!979205 () Bool)

(declare-fun res!655354 () Bool)

(assert (=> b!979205 (=> (not res!655354) (not e!551962))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61234 (_ BitVec 32)) Bool)

(assert (=> b!979205 (= res!655354 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!979206 () Bool)

(assert (=> b!979206 (= e!551966 tp_is_empty!22645)))

(declare-fun mapNonEmpty!35996 () Bool)

(declare-fun tp!68395 () Bool)

(assert (=> mapNonEmpty!35996 (= mapRes!35996 (and tp!68395 e!551961))))

(declare-fun mapKey!35996 () (_ BitVec 32))

(declare-fun mapRest!35996 () (Array (_ BitVec 32) ValueCell!10841))

(declare-fun mapValue!35996 () ValueCell!10841)

(assert (=> mapNonEmpty!35996 (= (arr!29474 _values!1278) (store mapRest!35996 mapKey!35996 mapValue!35996))))

(declare-fun res!655358 () Bool)

(assert (=> start!83824 (=> (not res!655358) (not e!551962))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83824 (= res!655358 (validMask!0 mask!1948))))

(assert (=> start!83824 e!551962))

(assert (=> start!83824 true))

(assert (=> start!83824 tp_is_empty!22645))

(declare-fun array_inv!22821 (array!61232) Bool)

(assert (=> start!83824 (and (array_inv!22821 _values!1278) e!551964)))

(assert (=> start!83824 tp!68396))

(declare-fun array_inv!22822 (array!61234) Bool)

(assert (=> start!83824 (array_inv!22822 _keys!1544)))

(declare-fun b!979207 () Bool)

(assert (=> b!979207 (= e!551963 true)))

(assert (=> b!979207 (= lt!434219 (+!2985 (+!2985 lt!434221 lt!434216) lt!434215))))

(declare-fun lt!434218 () Unit!32436)

(assert (=> b!979207 (= lt!434218 (addCommutativeForDiffKeys!589 lt!434221 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29475 _keys!1544) from!1932) lt!434217))))

(declare-fun mapIsEmpty!35996 () Bool)

(assert (=> mapIsEmpty!35996 mapRes!35996))

(assert (= (and start!83824 res!655358) b!979201))

(assert (= (and b!979201 res!655356) b!979205))

(assert (= (and b!979205 res!655354) b!979200))

(assert (= (and b!979200 res!655357) b!979202))

(assert (= (and b!979202 res!655353) b!979204))

(assert (= (and b!979204 res!655352) b!979198))

(assert (= (and b!979198 res!655359) b!979203))

(assert (= (and b!979203 (not res!655355)) b!979207))

(assert (= (and b!979197 condMapEmpty!35996) mapIsEmpty!35996))

(assert (= (and b!979197 (not condMapEmpty!35996)) mapNonEmpty!35996))

(get-info :version)

(assert (= (and mapNonEmpty!35996 ((_ is ValueCellFull!10841) mapValue!35996)) b!979199))

(assert (= (and b!979197 ((_ is ValueCellFull!10841) mapDefault!35996)) b!979206))

(assert (= start!83824 b!979197))

(declare-fun b_lambda!14677 () Bool)

(assert (=> (not b_lambda!14677) (not b!979203)))

(declare-fun t!29074 () Bool)

(declare-fun tb!6449 () Bool)

(assert (=> (and start!83824 (= defaultEntry!1281 defaultEntry!1281) t!29074) tb!6449))

(declare-fun result!12895 () Bool)

(assert (=> tb!6449 (= result!12895 tp_is_empty!22645)))

(assert (=> b!979203 t!29074))

(declare-fun b_and!31367 () Bool)

(assert (= b_and!31365 (and (=> t!29074 result!12895) b_and!31367)))

(declare-fun m!905987 () Bool)

(assert (=> b!979204 m!905987))

(assert (=> b!979204 m!905987))

(declare-fun m!905989 () Bool)

(assert (=> b!979204 m!905989))

(declare-fun m!905991 () Bool)

(assert (=> mapNonEmpty!35996 m!905991))

(declare-fun m!905993 () Bool)

(assert (=> b!979207 m!905993))

(assert (=> b!979207 m!905993))

(declare-fun m!905995 () Bool)

(assert (=> b!979207 m!905995))

(assert (=> b!979207 m!905987))

(assert (=> b!979207 m!905987))

(declare-fun m!905997 () Bool)

(assert (=> b!979207 m!905997))

(assert (=> b!979203 m!905987))

(declare-fun m!905999 () Bool)

(assert (=> b!979203 m!905999))

(declare-fun m!906001 () Bool)

(assert (=> b!979203 m!906001))

(declare-fun m!906003 () Bool)

(assert (=> b!979203 m!906003))

(declare-fun m!906005 () Bool)

(assert (=> b!979203 m!906005))

(declare-fun m!906007 () Bool)

(assert (=> b!979203 m!906007))

(declare-fun m!906009 () Bool)

(assert (=> b!979203 m!906009))

(declare-fun m!906011 () Bool)

(assert (=> b!979203 m!906011))

(assert (=> b!979203 m!905987))

(declare-fun m!906013 () Bool)

(assert (=> b!979203 m!906013))

(declare-fun m!906015 () Bool)

(assert (=> b!979203 m!906015))

(assert (=> b!979203 m!906007))

(assert (=> b!979203 m!906015))

(declare-fun m!906017 () Bool)

(assert (=> b!979203 m!906017))

(declare-fun m!906019 () Bool)

(assert (=> start!83824 m!906019))

(declare-fun m!906021 () Bool)

(assert (=> start!83824 m!906021))

(declare-fun m!906023 () Bool)

(assert (=> start!83824 m!906023))

(declare-fun m!906025 () Bool)

(assert (=> b!979205 m!906025))

(declare-fun m!906027 () Bool)

(assert (=> b!979200 m!906027))

(check-sat (not b!979200) b_and!31367 (not b!979205) (not mapNonEmpty!35996) (not b!979207) tp_is_empty!22645 (not b_next!19651) (not b!979203) (not b_lambda!14677) (not b!979204) (not start!83824))
(check-sat b_and!31367 (not b_next!19651))
