; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84226 () Bool)

(assert start!84226)

(declare-fun b_free!19945 () Bool)

(declare-fun b_next!19945 () Bool)

(assert (=> start!84226 (= b_free!19945 (not b_next!19945))))

(declare-fun tp!69439 () Bool)

(declare-fun b_and!31941 () Bool)

(assert (=> start!84226 (= tp!69439 b_and!31941)))

(declare-fun b!985338 () Bool)

(declare-fun e!555402 () Bool)

(declare-fun e!555400 () Bool)

(declare-fun mapRes!36599 () Bool)

(assert (=> b!985338 (= e!555402 (and e!555400 mapRes!36599))))

(declare-fun condMapEmpty!36599 () Bool)

(declare-datatypes ((V!35713 0))(
  ( (V!35714 (val!11574 Int)) )
))
(declare-datatypes ((ValueCell!11042 0))(
  ( (ValueCellFull!11042 (v!14135 V!35713)) (EmptyCell!11042) )
))
(declare-datatypes ((array!61996 0))(
  ( (array!61997 (arr!29856 (Array (_ BitVec 32) ValueCell!11042)) (size!30337 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61996)

(declare-fun mapDefault!36599 () ValueCell!11042)

(assert (=> b!985338 (= condMapEmpty!36599 (= (arr!29856 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11042)) mapDefault!36599)))))

(declare-fun b!985339 () Bool)

(declare-fun res!659405 () Bool)

(declare-fun e!555404 () Bool)

(assert (=> b!985339 (=> (not res!659405) (not e!555404))))

(declare-datatypes ((array!61998 0))(
  ( (array!61999 (arr!29857 (Array (_ BitVec 32) (_ BitVec 64))) (size!30338 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61998)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!985339 (= res!659405 (validKeyInArray!0 (select (arr!29857 _keys!1544) from!1932)))))

(declare-fun b!985340 () Bool)

(declare-fun e!555403 () Bool)

(declare-fun tp_is_empty!23047 () Bool)

(assert (=> b!985340 (= e!555403 tp_is_empty!23047)))

(declare-fun b!985341 () Bool)

(declare-fun res!659404 () Bool)

(assert (=> b!985341 (=> (not res!659404) (not e!555404))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61998 (_ BitVec 32)) Bool)

(assert (=> b!985341 (= res!659404 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!985342 () Bool)

(assert (=> b!985342 (= e!555400 tp_is_empty!23047)))

(declare-fun b!985343 () Bool)

(declare-fun e!555401 () Bool)

(assert (=> b!985343 (= e!555401 (not true))))

(declare-datatypes ((tuple2!14892 0))(
  ( (tuple2!14893 (_1!7457 (_ BitVec 64)) (_2!7457 V!35713)) )
))
(declare-datatypes ((List!20740 0))(
  ( (Nil!20737) (Cons!20736 (h!21898 tuple2!14892) (t!29620 List!20740)) )
))
(declare-datatypes ((ListLongMap!13579 0))(
  ( (ListLongMap!13580 (toList!6805 List!20740)) )
))
(declare-fun lt!437068 () ListLongMap!13579)

(declare-fun lt!437069 () tuple2!14892)

(declare-fun lt!437070 () tuple2!14892)

(declare-fun +!3081 (ListLongMap!13579 tuple2!14892) ListLongMap!13579)

(assert (=> b!985343 (= (+!3081 (+!3081 lt!437068 lt!437069) lt!437070) (+!3081 (+!3081 lt!437068 lt!437070) lt!437069))))

(declare-fun lt!437066 () V!35713)

(assert (=> b!985343 (= lt!437070 (tuple2!14893 (select (arr!29857 _keys!1544) from!1932) lt!437066))))

(declare-fun minValue!1220 () V!35713)

(assert (=> b!985343 (= lt!437069 (tuple2!14893 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32628 0))(
  ( (Unit!32629) )
))
(declare-fun lt!437067 () Unit!32628)

(declare-fun addCommutativeForDiffKeys!685 (ListLongMap!13579 (_ BitVec 64) V!35713 (_ BitVec 64) V!35713) Unit!32628)

(assert (=> b!985343 (= lt!437067 (addCommutativeForDiffKeys!685 lt!437068 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29857 _keys!1544) from!1932) lt!437066))))

(declare-fun res!659402 () Bool)

(assert (=> start!84226 (=> (not res!659402) (not e!555404))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84226 (= res!659402 (validMask!0 mask!1948))))

(assert (=> start!84226 e!555404))

(assert (=> start!84226 true))

(assert (=> start!84226 tp_is_empty!23047))

(declare-fun array_inv!23085 (array!61996) Bool)

(assert (=> start!84226 (and (array_inv!23085 _values!1278) e!555402)))

(assert (=> start!84226 tp!69439))

(declare-fun array_inv!23086 (array!61998) Bool)

(assert (=> start!84226 (array_inv!23086 _keys!1544)))

(declare-fun b!985344 () Bool)

(assert (=> b!985344 (= e!555404 e!555401)))

(declare-fun res!659408 () Bool)

(assert (=> b!985344 (=> (not res!659408) (not e!555401))))

(assert (=> b!985344 (= res!659408 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29857 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15519 (ValueCell!11042 V!35713) V!35713)

(declare-fun dynLambda!1837 (Int (_ BitVec 64)) V!35713)

(assert (=> b!985344 (= lt!437066 (get!15519 (select (arr!29856 _values!1278) from!1932) (dynLambda!1837 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35713)

(declare-fun getCurrentListMapNoExtraKeys!3509 (array!61998 array!61996 (_ BitVec 32) (_ BitVec 32) V!35713 V!35713 (_ BitVec 32) Int) ListLongMap!13579)

(assert (=> b!985344 (= lt!437068 (getCurrentListMapNoExtraKeys!3509 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!985345 () Bool)

(declare-fun res!659409 () Bool)

(assert (=> b!985345 (=> (not res!659409) (not e!555404))))

(assert (=> b!985345 (= res!659409 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!985346 () Bool)

(declare-fun res!659406 () Bool)

(assert (=> b!985346 (=> (not res!659406) (not e!555404))))

(assert (=> b!985346 (= res!659406 (and (= (size!30337 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30338 _keys!1544) (size!30337 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!985347 () Bool)

(declare-fun res!659407 () Bool)

(assert (=> b!985347 (=> (not res!659407) (not e!555404))))

(assert (=> b!985347 (= res!659407 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30338 _keys!1544))))))

(declare-fun mapNonEmpty!36599 () Bool)

(declare-fun tp!69440 () Bool)

(assert (=> mapNonEmpty!36599 (= mapRes!36599 (and tp!69440 e!555403))))

(declare-fun mapValue!36599 () ValueCell!11042)

(declare-fun mapRest!36599 () (Array (_ BitVec 32) ValueCell!11042))

(declare-fun mapKey!36599 () (_ BitVec 32))

(assert (=> mapNonEmpty!36599 (= (arr!29856 _values!1278) (store mapRest!36599 mapKey!36599 mapValue!36599))))

(declare-fun b!985348 () Bool)

(declare-fun res!659403 () Bool)

(assert (=> b!985348 (=> (not res!659403) (not e!555404))))

(declare-datatypes ((List!20741 0))(
  ( (Nil!20738) (Cons!20737 (h!21899 (_ BitVec 64)) (t!29621 List!20741)) )
))
(declare-fun arrayNoDuplicates!0 (array!61998 (_ BitVec 32) List!20741) Bool)

(assert (=> b!985348 (= res!659403 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20738))))

(declare-fun mapIsEmpty!36599 () Bool)

(assert (=> mapIsEmpty!36599 mapRes!36599))

(assert (= (and start!84226 res!659402) b!985346))

(assert (= (and b!985346 res!659406) b!985341))

(assert (= (and b!985341 res!659404) b!985348))

(assert (= (and b!985348 res!659403) b!985347))

(assert (= (and b!985347 res!659407) b!985339))

(assert (= (and b!985339 res!659405) b!985345))

(assert (= (and b!985345 res!659409) b!985344))

(assert (= (and b!985344 res!659408) b!985343))

(assert (= (and b!985338 condMapEmpty!36599) mapIsEmpty!36599))

(assert (= (and b!985338 (not condMapEmpty!36599)) mapNonEmpty!36599))

(get-info :version)

(assert (= (and mapNonEmpty!36599 ((_ is ValueCellFull!11042) mapValue!36599)) b!985340))

(assert (= (and b!985338 ((_ is ValueCellFull!11042) mapDefault!36599)) b!985342))

(assert (= start!84226 b!985338))

(declare-fun b_lambda!14959 () Bool)

(assert (=> (not b_lambda!14959) (not b!985344)))

(declare-fun t!29619 () Bool)

(declare-fun tb!6731 () Bool)

(assert (=> (and start!84226 (= defaultEntry!1281 defaultEntry!1281) t!29619) tb!6731))

(declare-fun result!13459 () Bool)

(assert (=> tb!6731 (= result!13459 tp_is_empty!23047)))

(assert (=> b!985344 t!29619))

(declare-fun b_and!31943 () Bool)

(assert (= b_and!31941 (and (=> t!29619 result!13459) b_and!31943)))

(declare-fun m!911873 () Bool)

(assert (=> b!985339 m!911873))

(assert (=> b!985339 m!911873))

(declare-fun m!911875 () Bool)

(assert (=> b!985339 m!911875))

(declare-fun m!911877 () Bool)

(assert (=> mapNonEmpty!36599 m!911877))

(declare-fun m!911879 () Bool)

(assert (=> start!84226 m!911879))

(declare-fun m!911881 () Bool)

(assert (=> start!84226 m!911881))

(declare-fun m!911883 () Bool)

(assert (=> start!84226 m!911883))

(declare-fun m!911885 () Bool)

(assert (=> b!985341 m!911885))

(declare-fun m!911887 () Bool)

(assert (=> b!985348 m!911887))

(assert (=> b!985343 m!911873))

(declare-fun m!911889 () Bool)

(assert (=> b!985343 m!911889))

(declare-fun m!911891 () Bool)

(assert (=> b!985343 m!911891))

(declare-fun m!911893 () Bool)

(assert (=> b!985343 m!911893))

(declare-fun m!911895 () Bool)

(assert (=> b!985343 m!911895))

(assert (=> b!985343 m!911873))

(declare-fun m!911897 () Bool)

(assert (=> b!985343 m!911897))

(assert (=> b!985343 m!911893))

(assert (=> b!985343 m!911889))

(assert (=> b!985344 m!911873))

(declare-fun m!911899 () Bool)

(assert (=> b!985344 m!911899))

(declare-fun m!911901 () Bool)

(assert (=> b!985344 m!911901))

(declare-fun m!911903 () Bool)

(assert (=> b!985344 m!911903))

(assert (=> b!985344 m!911899))

(assert (=> b!985344 m!911903))

(declare-fun m!911905 () Bool)

(assert (=> b!985344 m!911905))

(check-sat (not b!985344) (not b!985343) (not b!985348) tp_is_empty!23047 b_and!31943 (not b_next!19945) (not start!84226) (not b!985341) (not b_lambda!14959) (not mapNonEmpty!36599) (not b!985339))
(check-sat b_and!31943 (not b_next!19945))
