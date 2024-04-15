; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83818 () Bool)

(assert start!83818)

(declare-fun b_free!19645 () Bool)

(declare-fun b_next!19645 () Bool)

(assert (=> start!83818 (= b_free!19645 (not b_next!19645))))

(declare-fun tp!68377 () Bool)

(declare-fun b_and!31353 () Bool)

(assert (=> start!83818 (= tp!68377 b_and!31353)))

(declare-fun b!979092 () Bool)

(declare-fun res!655286 () Bool)

(declare-fun e!551910 () Bool)

(assert (=> b!979092 (=> (not res!655286) (not e!551910))))

(declare-datatypes ((array!61220 0))(
  ( (array!61221 (arr!29468 (Array (_ BitVec 32) (_ BitVec 64))) (size!29949 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61220)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!979092 (= res!655286 (validKeyInArray!0 (select (arr!29468 _keys!1544) from!1932)))))

(declare-fun b!979093 () Bool)

(declare-fun res!655284 () Bool)

(assert (=> b!979093 (=> (not res!655284) (not e!551910))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61220 (_ BitVec 32)) Bool)

(assert (=> b!979093 (= res!655284 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!979094 () Bool)

(declare-fun res!655281 () Bool)

(assert (=> b!979094 (=> (not res!655281) (not e!551910))))

(assert (=> b!979094 (= res!655281 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29949 _keys!1544))))))

(declare-fun mapNonEmpty!35987 () Bool)

(declare-fun mapRes!35987 () Bool)

(declare-fun tp!68378 () Bool)

(declare-fun e!551908 () Bool)

(assert (=> mapNonEmpty!35987 (= mapRes!35987 (and tp!68378 e!551908))))

(declare-datatypes ((V!35169 0))(
  ( (V!35170 (val!11370 Int)) )
))
(declare-datatypes ((ValueCell!10838 0))(
  ( (ValueCellFull!10838 (v!13931 V!35169)) (EmptyCell!10838) )
))
(declare-fun mapRest!35987 () (Array (_ BitVec 32) ValueCell!10838))

(declare-datatypes ((array!61222 0))(
  ( (array!61223 (arr!29469 (Array (_ BitVec 32) ValueCell!10838)) (size!29950 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61222)

(declare-fun mapValue!35987 () ValueCell!10838)

(declare-fun mapKey!35987 () (_ BitVec 32))

(assert (=> mapNonEmpty!35987 (= (arr!29469 _values!1278) (store mapRest!35987 mapKey!35987 mapValue!35987))))

(declare-fun b!979095 () Bool)

(declare-fun res!655285 () Bool)

(assert (=> b!979095 (=> (not res!655285) (not e!551910))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!979095 (= res!655285 (and (= (size!29950 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29949 _keys!1544) (size!29950 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!979096 () Bool)

(declare-fun res!655287 () Bool)

(assert (=> b!979096 (=> (not res!655287) (not e!551910))))

(assert (=> b!979096 (= res!655287 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!655283 () Bool)

(assert (=> start!83818 (=> (not res!655283) (not e!551910))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83818 (= res!655283 (validMask!0 mask!1948))))

(assert (=> start!83818 e!551910))

(assert (=> start!83818 true))

(declare-fun tp_is_empty!22639 () Bool)

(assert (=> start!83818 tp_is_empty!22639))

(declare-fun e!551911 () Bool)

(declare-fun array_inv!22817 (array!61222) Bool)

(assert (=> start!83818 (and (array_inv!22817 _values!1278) e!551911)))

(assert (=> start!83818 tp!68377))

(declare-fun array_inv!22818 (array!61220) Bool)

(assert (=> start!83818 (array_inv!22818 _keys!1544)))

(declare-fun b!979097 () Bool)

(declare-fun e!551909 () Bool)

(assert (=> b!979097 (= e!551911 (and e!551909 mapRes!35987))))

(declare-fun condMapEmpty!35987 () Bool)

(declare-fun mapDefault!35987 () ValueCell!10838)

(assert (=> b!979097 (= condMapEmpty!35987 (= (arr!29469 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10838)) mapDefault!35987)))))

(declare-fun b!979098 () Bool)

(assert (=> b!979098 (= e!551909 tp_is_empty!22639)))

(declare-fun mapIsEmpty!35987 () Bool)

(assert (=> mapIsEmpty!35987 mapRes!35987))

(declare-fun b!979099 () Bool)

(declare-fun e!551907 () Bool)

(assert (=> b!979099 (= e!551907 true)))

(declare-datatypes ((tuple2!14646 0))(
  ( (tuple2!14647 (_1!7334 (_ BitVec 64)) (_2!7334 V!35169)) )
))
(declare-fun lt!434132 () tuple2!14646)

(declare-datatypes ((List!20471 0))(
  ( (Nil!20468) (Cons!20467 (h!21629 tuple2!14646) (t!29063 List!20471)) )
))
(declare-datatypes ((ListLongMap!13333 0))(
  ( (ListLongMap!13334 (toList!6682 List!20471)) )
))
(declare-fun lt!434126 () ListLongMap!13333)

(declare-fun lt!434130 () tuple2!14646)

(declare-fun lt!434128 () ListLongMap!13333)

(declare-fun +!2982 (ListLongMap!13333 tuple2!14646) ListLongMap!13333)

(assert (=> b!979099 (= lt!434128 (+!2982 (+!2982 lt!434126 lt!434130) lt!434132))))

(declare-fun zeroValue!1220 () V!35169)

(declare-fun lt!434127 () V!35169)

(declare-datatypes ((Unit!32430 0))(
  ( (Unit!32431) )
))
(declare-fun lt!434124 () Unit!32430)

(declare-fun addCommutativeForDiffKeys!586 (ListLongMap!13333 (_ BitVec 64) V!35169 (_ BitVec 64) V!35169) Unit!32430)

(assert (=> b!979099 (= lt!434124 (addCommutativeForDiffKeys!586 lt!434126 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29468 _keys!1544) from!1932) lt!434127))))

(declare-fun b!979100 () Bool)

(assert (=> b!979100 (= e!551910 (not e!551907))))

(declare-fun res!655280 () Bool)

(assert (=> b!979100 (=> res!655280 e!551907)))

(assert (=> b!979100 (= res!655280 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29468 _keys!1544) from!1932)))))

(declare-fun lt!434125 () ListLongMap!13333)

(declare-fun lt!434133 () tuple2!14646)

(assert (=> b!979100 (= (+!2982 lt!434125 lt!434130) (+!2982 lt!434128 lt!434133))))

(declare-fun lt!434129 () ListLongMap!13333)

(assert (=> b!979100 (= lt!434128 (+!2982 lt!434129 lt!434130))))

(assert (=> b!979100 (= lt!434130 (tuple2!14647 (select (arr!29468 _keys!1544) from!1932) lt!434127))))

(assert (=> b!979100 (= lt!434125 (+!2982 lt!434129 lt!434133))))

(declare-fun minValue!1220 () V!35169)

(assert (=> b!979100 (= lt!434133 (tuple2!14647 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-fun lt!434131 () Unit!32430)

(assert (=> b!979100 (= lt!434131 (addCommutativeForDiffKeys!586 lt!434129 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29468 _keys!1544) from!1932) lt!434127))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15279 (ValueCell!10838 V!35169) V!35169)

(declare-fun dynLambda!1733 (Int (_ BitVec 64)) V!35169)

(assert (=> b!979100 (= lt!434127 (get!15279 (select (arr!29469 _values!1278) from!1932) (dynLambda!1733 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!979100 (= lt!434129 (+!2982 lt!434126 lt!434132))))

(assert (=> b!979100 (= lt!434132 (tuple2!14647 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun getCurrentListMapNoExtraKeys!3400 (array!61220 array!61222 (_ BitVec 32) (_ BitVec 32) V!35169 V!35169 (_ BitVec 32) Int) ListLongMap!13333)

(assert (=> b!979100 (= lt!434126 (getCurrentListMapNoExtraKeys!3400 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!979101 () Bool)

(assert (=> b!979101 (= e!551908 tp_is_empty!22639)))

(declare-fun b!979102 () Bool)

(declare-fun res!655282 () Bool)

(assert (=> b!979102 (=> (not res!655282) (not e!551910))))

(declare-datatypes ((List!20472 0))(
  ( (Nil!20469) (Cons!20468 (h!21630 (_ BitVec 64)) (t!29064 List!20472)) )
))
(declare-fun arrayNoDuplicates!0 (array!61220 (_ BitVec 32) List!20472) Bool)

(assert (=> b!979102 (= res!655282 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20469))))

(assert (= (and start!83818 res!655283) b!979095))

(assert (= (and b!979095 res!655285) b!979093))

(assert (= (and b!979093 res!655284) b!979102))

(assert (= (and b!979102 res!655282) b!979094))

(assert (= (and b!979094 res!655281) b!979092))

(assert (= (and b!979092 res!655286) b!979096))

(assert (= (and b!979096 res!655287) b!979100))

(assert (= (and b!979100 (not res!655280)) b!979099))

(assert (= (and b!979097 condMapEmpty!35987) mapIsEmpty!35987))

(assert (= (and b!979097 (not condMapEmpty!35987)) mapNonEmpty!35987))

(get-info :version)

(assert (= (and mapNonEmpty!35987 ((_ is ValueCellFull!10838) mapValue!35987)) b!979101))

(assert (= (and b!979097 ((_ is ValueCellFull!10838) mapDefault!35987)) b!979098))

(assert (= start!83818 b!979097))

(declare-fun b_lambda!14671 () Bool)

(assert (=> (not b_lambda!14671) (not b!979100)))

(declare-fun t!29062 () Bool)

(declare-fun tb!6443 () Bool)

(assert (=> (and start!83818 (= defaultEntry!1281 defaultEntry!1281) t!29062) tb!6443))

(declare-fun result!12883 () Bool)

(assert (=> tb!6443 (= result!12883 tp_is_empty!22639)))

(assert (=> b!979100 t!29062))

(declare-fun b_and!31355 () Bool)

(assert (= b_and!31353 (and (=> t!29062 result!12883) b_and!31355)))

(declare-fun m!905861 () Bool)

(assert (=> b!979092 m!905861))

(assert (=> b!979092 m!905861))

(declare-fun m!905863 () Bool)

(assert (=> b!979092 m!905863))

(declare-fun m!905865 () Bool)

(assert (=> start!83818 m!905865))

(declare-fun m!905867 () Bool)

(assert (=> start!83818 m!905867))

(declare-fun m!905869 () Bool)

(assert (=> start!83818 m!905869))

(declare-fun m!905871 () Bool)

(assert (=> b!979099 m!905871))

(assert (=> b!979099 m!905871))

(declare-fun m!905873 () Bool)

(assert (=> b!979099 m!905873))

(assert (=> b!979099 m!905861))

(assert (=> b!979099 m!905861))

(declare-fun m!905875 () Bool)

(assert (=> b!979099 m!905875))

(assert (=> b!979100 m!905861))

(declare-fun m!905877 () Bool)

(assert (=> b!979100 m!905877))

(declare-fun m!905879 () Bool)

(assert (=> b!979100 m!905879))

(declare-fun m!905881 () Bool)

(assert (=> b!979100 m!905881))

(declare-fun m!905883 () Bool)

(assert (=> b!979100 m!905883))

(assert (=> b!979100 m!905861))

(declare-fun m!905885 () Bool)

(assert (=> b!979100 m!905885))

(declare-fun m!905887 () Bool)

(assert (=> b!979100 m!905887))

(declare-fun m!905889 () Bool)

(assert (=> b!979100 m!905889))

(declare-fun m!905891 () Bool)

(assert (=> b!979100 m!905891))

(declare-fun m!905893 () Bool)

(assert (=> b!979100 m!905893))

(assert (=> b!979100 m!905877))

(assert (=> b!979100 m!905893))

(declare-fun m!905895 () Bool)

(assert (=> b!979100 m!905895))

(declare-fun m!905897 () Bool)

(assert (=> b!979102 m!905897))

(declare-fun m!905899 () Bool)

(assert (=> b!979093 m!905899))

(declare-fun m!905901 () Bool)

(assert (=> mapNonEmpty!35987 m!905901))

(check-sat (not b!979099) (not b!979092) (not b!979102) (not start!83818) (not b!979093) (not b!979100) b_and!31355 (not mapNonEmpty!35987) tp_is_empty!22639 (not b_lambda!14671) (not b_next!19645))
(check-sat b_and!31355 (not b_next!19645))
