; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83868 () Bool)

(assert start!83868)

(declare-fun b_free!19677 () Bool)

(declare-fun b_next!19677 () Bool)

(assert (=> start!83868 (= b_free!19677 (not b_next!19677))))

(declare-fun tp!68473 () Bool)

(declare-fun b_and!31443 () Bool)

(assert (=> start!83868 (= tp!68473 b_and!31443)))

(declare-fun b!979891 () Bool)

(declare-fun res!655776 () Bool)

(declare-fun e!552347 () Bool)

(assert (=> b!979891 (=> (not res!655776) (not e!552347))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61355 0))(
  ( (array!61356 (arr!29535 (Array (_ BitVec 32) (_ BitVec 64))) (size!30014 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61355)

(assert (=> b!979891 (= res!655776 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30014 _keys!1544))))))

(declare-fun b!979892 () Bool)

(declare-fun res!655778 () Bool)

(assert (=> b!979892 (=> (not res!655778) (not e!552347))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!979892 (= res!655778 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!36035 () Bool)

(declare-fun mapRes!36035 () Bool)

(declare-fun tp!68472 () Bool)

(declare-fun e!552348 () Bool)

(assert (=> mapNonEmpty!36035 (= mapRes!36035 (and tp!68472 e!552348))))

(declare-datatypes ((V!35211 0))(
  ( (V!35212 (val!11386 Int)) )
))
(declare-datatypes ((ValueCell!10854 0))(
  ( (ValueCellFull!10854 (v!13948 V!35211)) (EmptyCell!10854) )
))
(declare-datatypes ((array!61357 0))(
  ( (array!61358 (arr!29536 (Array (_ BitVec 32) ValueCell!10854)) (size!30015 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61357)

(declare-fun mapRest!36035 () (Array (_ BitVec 32) ValueCell!10854))

(declare-fun mapValue!36035 () ValueCell!10854)

(declare-fun mapKey!36035 () (_ BitVec 32))

(assert (=> mapNonEmpty!36035 (= (arr!29536 _values!1278) (store mapRest!36035 mapKey!36035 mapValue!36035))))

(declare-fun b!979893 () Bool)

(declare-fun res!655780 () Bool)

(assert (=> b!979893 (=> (not res!655780) (not e!552347))))

(declare-fun mask!1948 () (_ BitVec 32))

(assert (=> b!979893 (= res!655780 (and (= (size!30015 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30014 _keys!1544) (size!30015 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!979894 () Bool)

(declare-fun res!655777 () Bool)

(assert (=> b!979894 (=> (not res!655777) (not e!552347))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61355 (_ BitVec 32)) Bool)

(assert (=> b!979894 (= res!655777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!979895 () Bool)

(declare-fun e!552344 () Bool)

(assert (=> b!979895 (= e!552344 true)))

(declare-datatypes ((tuple2!14604 0))(
  ( (tuple2!14605 (_1!7313 (_ BitVec 64)) (_2!7313 V!35211)) )
))
(declare-datatypes ((List!20471 0))(
  ( (Nil!20468) (Cons!20467 (h!21629 tuple2!14604) (t!29104 List!20471)) )
))
(declare-datatypes ((ListLongMap!13301 0))(
  ( (ListLongMap!13302 (toList!6666 List!20471)) )
))
(declare-fun lt!434844 () ListLongMap!13301)

(declare-fun lt!434846 () tuple2!14604)

(declare-fun lt!434840 () ListLongMap!13301)

(declare-fun lt!434845 () tuple2!14604)

(declare-fun +!2971 (ListLongMap!13301 tuple2!14604) ListLongMap!13301)

(assert (=> b!979895 (= lt!434840 (+!2971 (+!2971 lt!434844 lt!434846) lt!434845))))

(declare-fun lt!434849 () V!35211)

(declare-datatypes ((Unit!32581 0))(
  ( (Unit!32582) )
))
(declare-fun lt!434843 () Unit!32581)

(declare-fun zeroValue!1220 () V!35211)

(declare-fun addCommutativeForDiffKeys!599 (ListLongMap!13301 (_ BitVec 64) V!35211 (_ BitVec 64) V!35211) Unit!32581)

(assert (=> b!979895 (= lt!434843 (addCommutativeForDiffKeys!599 lt!434844 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29535 _keys!1544) from!1932) lt!434849))))

(declare-fun b!979896 () Bool)

(declare-fun e!552343 () Bool)

(declare-fun e!552345 () Bool)

(assert (=> b!979896 (= e!552343 (and e!552345 mapRes!36035))))

(declare-fun condMapEmpty!36035 () Bool)

(declare-fun mapDefault!36035 () ValueCell!10854)

(assert (=> b!979896 (= condMapEmpty!36035 (= (arr!29536 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10854)) mapDefault!36035)))))

(declare-fun b!979897 () Bool)

(declare-fun tp_is_empty!22671 () Bool)

(assert (=> b!979897 (= e!552345 tp_is_empty!22671)))

(declare-fun b!979898 () Bool)

(assert (=> b!979898 (= e!552347 (not e!552344))))

(declare-fun res!655775 () Bool)

(assert (=> b!979898 (=> res!655775 e!552344)))

(assert (=> b!979898 (= res!655775 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29535 _keys!1544) from!1932)))))

(declare-fun lt!434847 () tuple2!14604)

(declare-fun lt!434841 () ListLongMap!13301)

(assert (=> b!979898 (= (+!2971 lt!434841 lt!434846) (+!2971 lt!434840 lt!434847))))

(declare-fun lt!434848 () ListLongMap!13301)

(assert (=> b!979898 (= lt!434840 (+!2971 lt!434848 lt!434846))))

(assert (=> b!979898 (= lt!434846 (tuple2!14605 (select (arr!29535 _keys!1544) from!1932) lt!434849))))

(assert (=> b!979898 (= lt!434841 (+!2971 lt!434848 lt!434847))))

(declare-fun minValue!1220 () V!35211)

(assert (=> b!979898 (= lt!434847 (tuple2!14605 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-fun lt!434842 () Unit!32581)

(assert (=> b!979898 (= lt!434842 (addCommutativeForDiffKeys!599 lt!434848 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29535 _keys!1544) from!1932) lt!434849))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15308 (ValueCell!10854 V!35211) V!35211)

(declare-fun dynLambda!1757 (Int (_ BitVec 64)) V!35211)

(assert (=> b!979898 (= lt!434849 (get!15308 (select (arr!29536 _values!1278) from!1932) (dynLambda!1757 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!979898 (= lt!434848 (+!2971 lt!434844 lt!434845))))

(assert (=> b!979898 (= lt!434845 (tuple2!14605 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun getCurrentListMapNoExtraKeys!3371 (array!61355 array!61357 (_ BitVec 32) (_ BitVec 32) V!35211 V!35211 (_ BitVec 32) Int) ListLongMap!13301)

(assert (=> b!979898 (= lt!434844 (getCurrentListMapNoExtraKeys!3371 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun res!655774 () Bool)

(assert (=> start!83868 (=> (not res!655774) (not e!552347))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83868 (= res!655774 (validMask!0 mask!1948))))

(assert (=> start!83868 e!552347))

(assert (=> start!83868 true))

(assert (=> start!83868 tp_is_empty!22671))

(declare-fun array_inv!22833 (array!61357) Bool)

(assert (=> start!83868 (and (array_inv!22833 _values!1278) e!552343)))

(assert (=> start!83868 tp!68473))

(declare-fun array_inv!22834 (array!61355) Bool)

(assert (=> start!83868 (array_inv!22834 _keys!1544)))

(declare-fun b!979899 () Bool)

(assert (=> b!979899 (= e!552348 tp_is_empty!22671)))

(declare-fun b!979900 () Bool)

(declare-fun res!655781 () Bool)

(assert (=> b!979900 (=> (not res!655781) (not e!552347))))

(declare-datatypes ((List!20472 0))(
  ( (Nil!20469) (Cons!20468 (h!21630 (_ BitVec 64)) (t!29105 List!20472)) )
))
(declare-fun arrayNoDuplicates!0 (array!61355 (_ BitVec 32) List!20472) Bool)

(assert (=> b!979900 (= res!655781 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20469))))

(declare-fun mapIsEmpty!36035 () Bool)

(assert (=> mapIsEmpty!36035 mapRes!36035))

(declare-fun b!979901 () Bool)

(declare-fun res!655779 () Bool)

(assert (=> b!979901 (=> (not res!655779) (not e!552347))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!979901 (= res!655779 (validKeyInArray!0 (select (arr!29535 _keys!1544) from!1932)))))

(assert (= (and start!83868 res!655774) b!979893))

(assert (= (and b!979893 res!655780) b!979894))

(assert (= (and b!979894 res!655777) b!979900))

(assert (= (and b!979900 res!655781) b!979891))

(assert (= (and b!979891 res!655776) b!979901))

(assert (= (and b!979901 res!655779) b!979892))

(assert (= (and b!979892 res!655778) b!979898))

(assert (= (and b!979898 (not res!655775)) b!979895))

(assert (= (and b!979896 condMapEmpty!36035) mapIsEmpty!36035))

(assert (= (and b!979896 (not condMapEmpty!36035)) mapNonEmpty!36035))

(get-info :version)

(assert (= (and mapNonEmpty!36035 ((_ is ValueCellFull!10854) mapValue!36035)) b!979899))

(assert (= (and b!979896 ((_ is ValueCellFull!10854) mapDefault!36035)) b!979897))

(assert (= start!83868 b!979896))

(declare-fun b_lambda!14721 () Bool)

(assert (=> (not b_lambda!14721) (not b!979898)))

(declare-fun t!29103 () Bool)

(declare-fun tb!6483 () Bool)

(assert (=> (and start!83868 (= defaultEntry!1281 defaultEntry!1281) t!29103) tb!6483))

(declare-fun result!12955 () Bool)

(assert (=> tb!6483 (= result!12955 tp_is_empty!22671)))

(assert (=> b!979898 t!29103))

(declare-fun b_and!31445 () Bool)

(assert (= b_and!31443 (and (=> t!29103 result!12955) b_and!31445)))

(declare-fun m!907291 () Bool)

(assert (=> b!979900 m!907291))

(declare-fun m!907293 () Bool)

(assert (=> b!979895 m!907293))

(assert (=> b!979895 m!907293))

(declare-fun m!907295 () Bool)

(assert (=> b!979895 m!907295))

(declare-fun m!907297 () Bool)

(assert (=> b!979895 m!907297))

(assert (=> b!979895 m!907297))

(declare-fun m!907299 () Bool)

(assert (=> b!979895 m!907299))

(declare-fun m!907301 () Bool)

(assert (=> b!979894 m!907301))

(assert (=> b!979901 m!907297))

(assert (=> b!979901 m!907297))

(declare-fun m!907303 () Bool)

(assert (=> b!979901 m!907303))

(declare-fun m!907305 () Bool)

(assert (=> mapNonEmpty!36035 m!907305))

(declare-fun m!907307 () Bool)

(assert (=> start!83868 m!907307))

(declare-fun m!907309 () Bool)

(assert (=> start!83868 m!907309))

(declare-fun m!907311 () Bool)

(assert (=> start!83868 m!907311))

(declare-fun m!907313 () Bool)

(assert (=> b!979898 m!907313))

(declare-fun m!907315 () Bool)

(assert (=> b!979898 m!907315))

(assert (=> b!979898 m!907297))

(declare-fun m!907317 () Bool)

(assert (=> b!979898 m!907317))

(assert (=> b!979898 m!907297))

(declare-fun m!907319 () Bool)

(assert (=> b!979898 m!907319))

(declare-fun m!907321 () Bool)

(assert (=> b!979898 m!907321))

(declare-fun m!907323 () Bool)

(assert (=> b!979898 m!907323))

(declare-fun m!907325 () Bool)

(assert (=> b!979898 m!907325))

(declare-fun m!907327 () Bool)

(assert (=> b!979898 m!907327))

(declare-fun m!907329 () Bool)

(assert (=> b!979898 m!907329))

(assert (=> b!979898 m!907317))

(assert (=> b!979898 m!907327))

(declare-fun m!907331 () Bool)

(assert (=> b!979898 m!907331))

(check-sat (not b_next!19677) (not b_lambda!14721) (not b!979894) (not mapNonEmpty!36035) tp_is_empty!22671 (not b!979900) (not b!979898) b_and!31445 (not b!979895) (not b!979901) (not start!83868))
(check-sat b_and!31445 (not b_next!19677))
