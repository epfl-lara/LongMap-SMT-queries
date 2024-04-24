; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84046 () Bool)

(assert start!84046)

(declare-fun b_free!19687 () Bool)

(declare-fun b_next!19687 () Bool)

(assert (=> start!84046 (= b_free!19687 (not b_next!19687))))

(declare-fun tp!68504 () Bool)

(declare-fun b_and!31473 () Bool)

(assert (=> start!84046 (= tp!68504 b_and!31473)))

(declare-fun b!980969 () Bool)

(declare-fun e!553019 () Bool)

(declare-fun e!553020 () Bool)

(declare-fun mapRes!36050 () Bool)

(assert (=> b!980969 (= e!553019 (and e!553020 mapRes!36050))))

(declare-fun condMapEmpty!36050 () Bool)

(declare-datatypes ((V!35225 0))(
  ( (V!35226 (val!11391 Int)) )
))
(declare-datatypes ((ValueCell!10859 0))(
  ( (ValueCellFull!10859 (v!13950 V!35225)) (EmptyCell!10859) )
))
(declare-datatypes ((array!61406 0))(
  ( (array!61407 (arr!29556 (Array (_ BitVec 32) ValueCell!10859)) (size!30036 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61406)

(declare-fun mapDefault!36050 () ValueCell!10859)

(assert (=> b!980969 (= condMapEmpty!36050 (= (arr!29556 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10859)) mapDefault!36050)))))

(declare-fun b!980970 () Bool)

(declare-fun res!656239 () Bool)

(declare-fun e!553018 () Bool)

(assert (=> b!980970 (=> (not res!656239) (not e!553018))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61408 0))(
  ( (array!61409 (arr!29557 (Array (_ BitVec 32) (_ BitVec 64))) (size!30037 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61408)

(assert (=> b!980970 (= res!656239 (and (= (size!30036 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30037 _keys!1544) (size!30036 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!980971 () Bool)

(declare-fun tp_is_empty!22681 () Bool)

(assert (=> b!980971 (= e!553020 tp_is_empty!22681)))

(declare-fun b!980972 () Bool)

(declare-fun res!656238 () Bool)

(assert (=> b!980972 (=> (not res!656238) (not e!553018))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61408 (_ BitVec 32)) Bool)

(assert (=> b!980972 (= res!656238 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun res!656240 () Bool)

(assert (=> start!84046 (=> (not res!656240) (not e!553018))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84046 (= res!656240 (validMask!0 mask!1948))))

(assert (=> start!84046 e!553018))

(assert (=> start!84046 true))

(assert (=> start!84046 tp_is_empty!22681))

(declare-fun array_inv!22885 (array!61406) Bool)

(assert (=> start!84046 (and (array_inv!22885 _values!1278) e!553019)))

(assert (=> start!84046 tp!68504))

(declare-fun array_inv!22886 (array!61408) Bool)

(assert (=> start!84046 (array_inv!22886 _keys!1544)))

(declare-fun b!980973 () Bool)

(declare-fun res!656242 () Bool)

(assert (=> b!980973 (=> (not res!656242) (not e!553018))))

(declare-datatypes ((List!20484 0))(
  ( (Nil!20481) (Cons!20480 (h!21648 (_ BitVec 64)) (t!29119 List!20484)) )
))
(declare-fun arrayNoDuplicates!0 (array!61408 (_ BitVec 32) List!20484) Bool)

(assert (=> b!980973 (= res!656242 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20481))))

(declare-fun b!980974 () Bool)

(declare-fun res!656241 () Bool)

(assert (=> b!980974 (=> (not res!656241) (not e!553018))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!980974 (= res!656241 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30037 _keys!1544))))))

(declare-fun mapIsEmpty!36050 () Bool)

(assert (=> mapIsEmpty!36050 mapRes!36050))

(declare-fun b!980975 () Bool)

(declare-fun e!553016 () Bool)

(assert (=> b!980975 (= e!553018 (not e!553016))))

(declare-fun res!656244 () Bool)

(assert (=> b!980975 (=> res!656244 e!553016)))

(assert (=> b!980975 (= res!656244 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29557 _keys!1544) from!1932)))))

(declare-datatypes ((tuple2!14624 0))(
  ( (tuple2!14625 (_1!7323 (_ BitVec 64)) (_2!7323 V!35225)) )
))
(declare-fun lt!435360 () tuple2!14624)

(declare-datatypes ((List!20485 0))(
  ( (Nil!20482) (Cons!20481 (h!21649 tuple2!14624) (t!29120 List!20485)) )
))
(declare-datatypes ((ListLongMap!13323 0))(
  ( (ListLongMap!13324 (toList!6677 List!20485)) )
))
(declare-fun lt!435353 () ListLongMap!13323)

(declare-fun lt!435355 () tuple2!14624)

(declare-fun lt!435357 () ListLongMap!13323)

(declare-fun +!2992 (ListLongMap!13323 tuple2!14624) ListLongMap!13323)

(assert (=> b!980975 (= (+!2992 lt!435353 lt!435360) (+!2992 lt!435357 lt!435355))))

(declare-fun lt!435358 () ListLongMap!13323)

(assert (=> b!980975 (= lt!435357 (+!2992 lt!435358 lt!435360))))

(declare-fun lt!435351 () V!35225)

(assert (=> b!980975 (= lt!435360 (tuple2!14625 (select (arr!29557 _keys!1544) from!1932) lt!435351))))

(assert (=> b!980975 (= lt!435353 (+!2992 lt!435358 lt!435355))))

(declare-fun minValue!1220 () V!35225)

(assert (=> b!980975 (= lt!435355 (tuple2!14625 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32564 0))(
  ( (Unit!32565) )
))
(declare-fun lt!435359 () Unit!32564)

(declare-fun addCommutativeForDiffKeys!599 (ListLongMap!13323 (_ BitVec 64) V!35225 (_ BitVec 64) V!35225) Unit!32564)

(assert (=> b!980975 (= lt!435359 (addCommutativeForDiffKeys!599 lt!435358 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29557 _keys!1544) from!1932) lt!435351))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15346 (ValueCell!10859 V!35225) V!35225)

(declare-fun dynLambda!1787 (Int (_ BitVec 64)) V!35225)

(assert (=> b!980975 (= lt!435351 (get!15346 (select (arr!29556 _values!1278) from!1932) (dynLambda!1787 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!435356 () ListLongMap!13323)

(declare-fun lt!435354 () tuple2!14624)

(assert (=> b!980975 (= lt!435358 (+!2992 lt!435356 lt!435354))))

(declare-fun zeroValue!1220 () V!35225)

(assert (=> b!980975 (= lt!435354 (tuple2!14625 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun getCurrentListMapNoExtraKeys!3425 (array!61408 array!61406 (_ BitVec 32) (_ BitVec 32) V!35225 V!35225 (_ BitVec 32) Int) ListLongMap!13323)

(assert (=> b!980975 (= lt!435356 (getCurrentListMapNoExtraKeys!3425 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!980976 () Bool)

(declare-fun res!656245 () Bool)

(assert (=> b!980976 (=> (not res!656245) (not e!553018))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!980976 (= res!656245 (validKeyInArray!0 (select (arr!29557 _keys!1544) from!1932)))))

(declare-fun b!980977 () Bool)

(declare-fun res!656243 () Bool)

(assert (=> b!980977 (=> (not res!656243) (not e!553018))))

(assert (=> b!980977 (= res!656243 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!980978 () Bool)

(assert (=> b!980978 (= e!553016 true)))

(assert (=> b!980978 (= lt!435357 (+!2992 (+!2992 lt!435356 lt!435360) lt!435354))))

(declare-fun lt!435352 () Unit!32564)

(assert (=> b!980978 (= lt!435352 (addCommutativeForDiffKeys!599 lt!435356 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29557 _keys!1544) from!1932) lt!435351))))

(declare-fun b!980979 () Bool)

(declare-fun e!553015 () Bool)

(assert (=> b!980979 (= e!553015 tp_is_empty!22681)))

(declare-fun mapNonEmpty!36050 () Bool)

(declare-fun tp!68503 () Bool)

(assert (=> mapNonEmpty!36050 (= mapRes!36050 (and tp!68503 e!553015))))

(declare-fun mapKey!36050 () (_ BitVec 32))

(declare-fun mapRest!36050 () (Array (_ BitVec 32) ValueCell!10859))

(declare-fun mapValue!36050 () ValueCell!10859)

(assert (=> mapNonEmpty!36050 (= (arr!29556 _values!1278) (store mapRest!36050 mapKey!36050 mapValue!36050))))

(assert (= (and start!84046 res!656240) b!980970))

(assert (= (and b!980970 res!656239) b!980972))

(assert (= (and b!980972 res!656238) b!980973))

(assert (= (and b!980973 res!656242) b!980974))

(assert (= (and b!980974 res!656241) b!980976))

(assert (= (and b!980976 res!656245) b!980977))

(assert (= (and b!980977 res!656243) b!980975))

(assert (= (and b!980975 (not res!656244)) b!980978))

(assert (= (and b!980969 condMapEmpty!36050) mapIsEmpty!36050))

(assert (= (and b!980969 (not condMapEmpty!36050)) mapNonEmpty!36050))

(get-info :version)

(assert (= (and mapNonEmpty!36050 ((_ is ValueCellFull!10859) mapValue!36050)) b!980979))

(assert (= (and b!980969 ((_ is ValueCellFull!10859) mapDefault!36050)) b!980971))

(assert (= start!84046 b!980969))

(declare-fun b_lambda!14745 () Bool)

(assert (=> (not b_lambda!14745) (not b!980975)))

(declare-fun t!29118 () Bool)

(declare-fun tb!6485 () Bool)

(assert (=> (and start!84046 (= defaultEntry!1281 defaultEntry!1281) t!29118) tb!6485))

(declare-fun result!12967 () Bool)

(assert (=> tb!6485 (= result!12967 tp_is_empty!22681)))

(assert (=> b!980975 t!29118))

(declare-fun b_and!31475 () Bool)

(assert (= b_and!31473 (and (=> t!29118 result!12967) b_and!31475)))

(declare-fun m!908795 () Bool)

(assert (=> b!980975 m!908795))

(declare-fun m!908797 () Bool)

(assert (=> b!980975 m!908797))

(declare-fun m!908799 () Bool)

(assert (=> b!980975 m!908799))

(declare-fun m!908801 () Bool)

(assert (=> b!980975 m!908801))

(declare-fun m!908803 () Bool)

(assert (=> b!980975 m!908803))

(declare-fun m!908805 () Bool)

(assert (=> b!980975 m!908805))

(declare-fun m!908807 () Bool)

(assert (=> b!980975 m!908807))

(declare-fun m!908809 () Bool)

(assert (=> b!980975 m!908809))

(assert (=> b!980975 m!908795))

(declare-fun m!908811 () Bool)

(assert (=> b!980975 m!908811))

(declare-fun m!908813 () Bool)

(assert (=> b!980975 m!908813))

(assert (=> b!980975 m!908797))

(assert (=> b!980975 m!908813))

(declare-fun m!908815 () Bool)

(assert (=> b!980975 m!908815))

(declare-fun m!908817 () Bool)

(assert (=> b!980978 m!908817))

(assert (=> b!980978 m!908817))

(declare-fun m!908819 () Bool)

(assert (=> b!980978 m!908819))

(assert (=> b!980978 m!908795))

(assert (=> b!980978 m!908795))

(declare-fun m!908821 () Bool)

(assert (=> b!980978 m!908821))

(assert (=> b!980976 m!908795))

(assert (=> b!980976 m!908795))

(declare-fun m!908823 () Bool)

(assert (=> b!980976 m!908823))

(declare-fun m!908825 () Bool)

(assert (=> mapNonEmpty!36050 m!908825))

(declare-fun m!908827 () Bool)

(assert (=> start!84046 m!908827))

(declare-fun m!908829 () Bool)

(assert (=> start!84046 m!908829))

(declare-fun m!908831 () Bool)

(assert (=> start!84046 m!908831))

(declare-fun m!908833 () Bool)

(assert (=> b!980973 m!908833))

(declare-fun m!908835 () Bool)

(assert (=> b!980972 m!908835))

(check-sat (not start!84046) tp_is_empty!22681 (not b!980978) (not b!980972) (not b!980976) (not b!980973) (not mapNonEmpty!36050) b_and!31475 (not b!980975) (not b_next!19687) (not b_lambda!14745))
(check-sat b_and!31475 (not b_next!19687))
