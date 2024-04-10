; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83820 () Bool)

(assert start!83820)

(declare-fun b_free!19629 () Bool)

(declare-fun b_next!19629 () Bool)

(assert (=> start!83820 (= b_free!19629 (not b_next!19629))))

(declare-fun tp!68328 () Bool)

(declare-fun b_and!31347 () Bool)

(assert (=> start!83820 (= tp!68328 b_and!31347)))

(declare-fun mapNonEmpty!35963 () Bool)

(declare-fun mapRes!35963 () Bool)

(declare-fun tp!68329 () Bool)

(declare-fun e!551911 () Bool)

(assert (=> mapNonEmpty!35963 (= mapRes!35963 (and tp!68329 e!551911))))

(declare-datatypes ((V!35147 0))(
  ( (V!35148 (val!11362 Int)) )
))
(declare-datatypes ((ValueCell!10830 0))(
  ( (ValueCellFull!10830 (v!13924 V!35147)) (EmptyCell!10830) )
))
(declare-fun mapValue!35963 () ValueCell!10830)

(declare-datatypes ((array!61267 0))(
  ( (array!61268 (arr!29491 (Array (_ BitVec 32) ValueCell!10830)) (size!29970 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61267)

(declare-fun mapKey!35963 () (_ BitVec 32))

(declare-fun mapRest!35963 () (Array (_ BitVec 32) ValueCell!10830))

(assert (=> mapNonEmpty!35963 (= (arr!29491 _values!1278) (store mapRest!35963 mapKey!35963 mapValue!35963))))

(declare-fun b!979051 () Bool)

(declare-fun res!655201 () Bool)

(declare-fun e!551913 () Bool)

(assert (=> b!979051 (=> (not res!655201) (not e!551913))))

(declare-datatypes ((array!61269 0))(
  ( (array!61270 (arr!29492 (Array (_ BitVec 32) (_ BitVec 64))) (size!29971 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61269)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61269 (_ BitVec 32)) Bool)

(assert (=> b!979051 (= res!655201 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!979052 () Bool)

(declare-fun res!655202 () Bool)

(assert (=> b!979052 (=> (not res!655202) (not e!551913))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!979052 (= res!655202 (validKeyInArray!0 (select (arr!29492 _keys!1544) from!1932)))))

(declare-fun b!979053 () Bool)

(declare-fun res!655200 () Bool)

(assert (=> b!979053 (=> (not res!655200) (not e!551913))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!979053 (= res!655200 (and (= (size!29970 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29971 _keys!1544) (size!29970 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!979054 () Bool)

(declare-fun e!551912 () Bool)

(declare-fun tp_is_empty!22623 () Bool)

(assert (=> b!979054 (= e!551912 tp_is_empty!22623)))

(declare-fun b!979056 () Bool)

(declare-fun e!551914 () Bool)

(assert (=> b!979056 (= e!551914 true)))

(declare-datatypes ((tuple2!14574 0))(
  ( (tuple2!14575 (_1!7298 (_ BitVec 64)) (_2!7298 V!35147)) )
))
(declare-fun lt!434121 () tuple2!14574)

(declare-datatypes ((List!20444 0))(
  ( (Nil!20441) (Cons!20440 (h!21602 tuple2!14574) (t!29029 List!20444)) )
))
(declare-datatypes ((ListLongMap!13271 0))(
  ( (ListLongMap!13272 (toList!6651 List!20444)) )
))
(declare-fun lt!434124 () ListLongMap!13271)

(declare-fun lt!434128 () ListLongMap!13271)

(declare-fun lt!434120 () tuple2!14574)

(declare-fun +!2956 (ListLongMap!13271 tuple2!14574) ListLongMap!13271)

(assert (=> b!979056 (= lt!434124 (+!2956 (+!2956 lt!434128 lt!434120) lt!434121))))

(declare-datatypes ((Unit!32551 0))(
  ( (Unit!32552) )
))
(declare-fun lt!434122 () Unit!32551)

(declare-fun zeroValue!1220 () V!35147)

(declare-fun lt!434123 () V!35147)

(declare-fun addCommutativeForDiffKeys!584 (ListLongMap!13271 (_ BitVec 64) V!35147 (_ BitVec 64) V!35147) Unit!32551)

(assert (=> b!979056 (= lt!434122 (addCommutativeForDiffKeys!584 lt!434128 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29492 _keys!1544) from!1932) lt!434123))))

(declare-fun b!979057 () Bool)

(declare-fun res!655205 () Bool)

(assert (=> b!979057 (=> (not res!655205) (not e!551913))))

(declare-datatypes ((List!20445 0))(
  ( (Nil!20442) (Cons!20441 (h!21603 (_ BitVec 64)) (t!29030 List!20445)) )
))
(declare-fun arrayNoDuplicates!0 (array!61269 (_ BitVec 32) List!20445) Bool)

(assert (=> b!979057 (= res!655205 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20442))))

(declare-fun b!979058 () Bool)

(assert (=> b!979058 (= e!551913 (not e!551914))))

(declare-fun res!655203 () Bool)

(assert (=> b!979058 (=> res!655203 e!551914)))

(assert (=> b!979058 (= res!655203 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29492 _keys!1544) from!1932)))))

(declare-fun lt!434126 () tuple2!14574)

(declare-fun lt!434127 () ListLongMap!13271)

(assert (=> b!979058 (= (+!2956 lt!434127 lt!434120) (+!2956 lt!434124 lt!434126))))

(declare-fun lt!434125 () ListLongMap!13271)

(assert (=> b!979058 (= lt!434124 (+!2956 lt!434125 lt!434120))))

(assert (=> b!979058 (= lt!434120 (tuple2!14575 (select (arr!29492 _keys!1544) from!1932) lt!434123))))

(assert (=> b!979058 (= lt!434127 (+!2956 lt!434125 lt!434126))))

(declare-fun minValue!1220 () V!35147)

(assert (=> b!979058 (= lt!434126 (tuple2!14575 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-fun lt!434129 () Unit!32551)

(assert (=> b!979058 (= lt!434129 (addCommutativeForDiffKeys!584 lt!434125 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29492 _keys!1544) from!1932) lt!434123))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15279 (ValueCell!10830 V!35147) V!35147)

(declare-fun dynLambda!1744 (Int (_ BitVec 64)) V!35147)

(assert (=> b!979058 (= lt!434123 (get!15279 (select (arr!29491 _values!1278) from!1932) (dynLambda!1744 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!979058 (= lt!434125 (+!2956 lt!434128 lt!434121))))

(assert (=> b!979058 (= lt!434121 (tuple2!14575 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun getCurrentListMapNoExtraKeys!3358 (array!61269 array!61267 (_ BitVec 32) (_ BitVec 32) V!35147 V!35147 (_ BitVec 32) Int) ListLongMap!13271)

(assert (=> b!979058 (= lt!434128 (getCurrentListMapNoExtraKeys!3358 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!979059 () Bool)

(declare-fun e!551916 () Bool)

(assert (=> b!979059 (= e!551916 (and e!551912 mapRes!35963))))

(declare-fun condMapEmpty!35963 () Bool)

(declare-fun mapDefault!35963 () ValueCell!10830)

(assert (=> b!979059 (= condMapEmpty!35963 (= (arr!29491 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10830)) mapDefault!35963)))))

(declare-fun mapIsEmpty!35963 () Bool)

(assert (=> mapIsEmpty!35963 mapRes!35963))

(declare-fun b!979060 () Bool)

(declare-fun res!655199 () Bool)

(assert (=> b!979060 (=> (not res!655199) (not e!551913))))

(assert (=> b!979060 (= res!655199 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29971 _keys!1544))))))

(declare-fun b!979061 () Bool)

(assert (=> b!979061 (= e!551911 tp_is_empty!22623)))

(declare-fun res!655204 () Bool)

(assert (=> start!83820 (=> (not res!655204) (not e!551913))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83820 (= res!655204 (validMask!0 mask!1948))))

(assert (=> start!83820 e!551913))

(assert (=> start!83820 true))

(assert (=> start!83820 tp_is_empty!22623))

(declare-fun array_inv!22801 (array!61267) Bool)

(assert (=> start!83820 (and (array_inv!22801 _values!1278) e!551916)))

(assert (=> start!83820 tp!68328))

(declare-fun array_inv!22802 (array!61269) Bool)

(assert (=> start!83820 (array_inv!22802 _keys!1544)))

(declare-fun b!979055 () Bool)

(declare-fun res!655198 () Bool)

(assert (=> b!979055 (=> (not res!655198) (not e!551913))))

(assert (=> b!979055 (= res!655198 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!83820 res!655204) b!979053))

(assert (= (and b!979053 res!655200) b!979051))

(assert (= (and b!979051 res!655201) b!979057))

(assert (= (and b!979057 res!655205) b!979060))

(assert (= (and b!979060 res!655199) b!979052))

(assert (= (and b!979052 res!655202) b!979055))

(assert (= (and b!979055 res!655198) b!979058))

(assert (= (and b!979058 (not res!655203)) b!979056))

(assert (= (and b!979059 condMapEmpty!35963) mapIsEmpty!35963))

(assert (= (and b!979059 (not condMapEmpty!35963)) mapNonEmpty!35963))

(get-info :version)

(assert (= (and mapNonEmpty!35963 ((_ is ValueCellFull!10830) mapValue!35963)) b!979061))

(assert (= (and b!979059 ((_ is ValueCellFull!10830) mapDefault!35963)) b!979054))

(assert (= start!83820 b!979059))

(declare-fun b_lambda!14673 () Bool)

(assert (=> (not b_lambda!14673) (not b!979058)))

(declare-fun t!29028 () Bool)

(declare-fun tb!6435 () Bool)

(assert (=> (and start!83820 (= defaultEntry!1281 defaultEntry!1281) t!29028) tb!6435))

(declare-fun result!12859 () Bool)

(assert (=> tb!6435 (= result!12859 tp_is_empty!22623)))

(assert (=> b!979058 t!29028))

(declare-fun b_and!31349 () Bool)

(assert (= b_and!31347 (and (=> t!29028 result!12859) b_and!31349)))

(declare-fun m!906283 () Bool)

(assert (=> b!979058 m!906283))

(declare-fun m!906285 () Bool)

(assert (=> b!979058 m!906285))

(assert (=> b!979058 m!906283))

(declare-fun m!906287 () Bool)

(assert (=> b!979058 m!906287))

(declare-fun m!906289 () Bool)

(assert (=> b!979058 m!906289))

(declare-fun m!906291 () Bool)

(assert (=> b!979058 m!906291))

(declare-fun m!906293 () Bool)

(assert (=> b!979058 m!906293))

(declare-fun m!906295 () Bool)

(assert (=> b!979058 m!906295))

(declare-fun m!906297 () Bool)

(assert (=> b!979058 m!906297))

(declare-fun m!906299 () Bool)

(assert (=> b!979058 m!906299))

(declare-fun m!906301 () Bool)

(assert (=> b!979058 m!906301))

(assert (=> b!979058 m!906285))

(assert (=> b!979058 m!906301))

(declare-fun m!906303 () Bool)

(assert (=> b!979058 m!906303))

(declare-fun m!906305 () Bool)

(assert (=> b!979057 m!906305))

(declare-fun m!906307 () Bool)

(assert (=> b!979056 m!906307))

(assert (=> b!979056 m!906307))

(declare-fun m!906309 () Bool)

(assert (=> b!979056 m!906309))

(assert (=> b!979056 m!906283))

(assert (=> b!979056 m!906283))

(declare-fun m!906311 () Bool)

(assert (=> b!979056 m!906311))

(declare-fun m!906313 () Bool)

(assert (=> mapNonEmpty!35963 m!906313))

(assert (=> b!979052 m!906283))

(assert (=> b!979052 m!906283))

(declare-fun m!906315 () Bool)

(assert (=> b!979052 m!906315))

(declare-fun m!906317 () Bool)

(assert (=> start!83820 m!906317))

(declare-fun m!906319 () Bool)

(assert (=> start!83820 m!906319))

(declare-fun m!906321 () Bool)

(assert (=> start!83820 m!906321))

(declare-fun m!906323 () Bool)

(assert (=> b!979051 m!906323))

(check-sat b_and!31349 (not start!83820) (not b!979057) (not b!979058) (not b!979056) (not b!979052) (not b_lambda!14673) (not b_next!19629) (not mapNonEmpty!35963) (not b!979051) tp_is_empty!22623)
(check-sat b_and!31349 (not b_next!19629))
