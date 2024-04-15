; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83872 () Bool)

(assert start!83872)

(declare-fun b_free!19699 () Bool)

(declare-fun b_next!19699 () Bool)

(assert (=> start!83872 (= b_free!19699 (not b_next!19699))))

(declare-fun tp!68539 () Bool)

(declare-fun b_and!31461 () Bool)

(assert (=> start!83872 (= tp!68539 b_and!31461)))

(declare-fun b!980037 () Bool)

(declare-fun e!552397 () Bool)

(assert (=> b!980037 (= e!552397 true)))

(declare-datatypes ((V!35241 0))(
  ( (V!35242 (val!11397 Int)) )
))
(declare-datatypes ((tuple2!14692 0))(
  ( (tuple2!14693 (_1!7357 (_ BitVec 64)) (_2!7357 V!35241)) )
))
(declare-fun lt!434939 () tuple2!14692)

(declare-datatypes ((List!20515 0))(
  ( (Nil!20512) (Cons!20511 (h!21673 tuple2!14692) (t!29161 List!20515)) )
))
(declare-datatypes ((ListLongMap!13379 0))(
  ( (ListLongMap!13380 (toList!6705 List!20515)) )
))
(declare-fun lt!434935 () ListLongMap!13379)

(declare-fun lt!434940 () ListLongMap!13379)

(declare-fun lt!434943 () tuple2!14692)

(declare-fun +!3005 (ListLongMap!13379 tuple2!14692) ListLongMap!13379)

(assert (=> b!980037 (= lt!434940 (+!3005 (+!3005 lt!434935 lt!434939) lt!434943))))

(declare-fun zeroValue!1220 () V!35241)

(declare-datatypes ((array!61322 0))(
  ( (array!61323 (arr!29519 (Array (_ BitVec 32) (_ BitVec 64))) (size!30000 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61322)

(declare-fun lt!434934 () V!35241)

(declare-datatypes ((Unit!32476 0))(
  ( (Unit!32477) )
))
(declare-fun lt!434942 () Unit!32476)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun addCommutativeForDiffKeys!609 (ListLongMap!13379 (_ BitVec 64) V!35241 (_ BitVec 64) V!35241) Unit!32476)

(assert (=> b!980037 (= lt!434942 (addCommutativeForDiffKeys!609 lt!434935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29519 _keys!1544) from!1932) lt!434934))))

(declare-fun b!980038 () Bool)

(declare-fun res!655929 () Bool)

(declare-fun e!552394 () Bool)

(assert (=> b!980038 (=> (not res!655929) (not e!552394))))

(declare-datatypes ((List!20516 0))(
  ( (Nil!20513) (Cons!20512 (h!21674 (_ BitVec 64)) (t!29162 List!20516)) )
))
(declare-fun arrayNoDuplicates!0 (array!61322 (_ BitVec 32) List!20516) Bool)

(assert (=> b!980038 (= res!655929 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20513))))

(declare-fun b!980039 () Bool)

(declare-fun e!552396 () Bool)

(declare-fun tp_is_empty!22693 () Bool)

(assert (=> b!980039 (= e!552396 tp_is_empty!22693)))

(declare-fun b!980040 () Bool)

(assert (=> b!980040 (= e!552394 (not e!552397))))

(declare-fun res!655928 () Bool)

(assert (=> b!980040 (=> res!655928 e!552397)))

(assert (=> b!980040 (= res!655928 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29519 _keys!1544) from!1932)))))

(declare-fun lt!434938 () ListLongMap!13379)

(declare-fun lt!434936 () tuple2!14692)

(assert (=> b!980040 (= (+!3005 lt!434938 lt!434939) (+!3005 lt!434940 lt!434936))))

(declare-fun lt!434937 () ListLongMap!13379)

(assert (=> b!980040 (= lt!434940 (+!3005 lt!434937 lt!434939))))

(assert (=> b!980040 (= lt!434939 (tuple2!14693 (select (arr!29519 _keys!1544) from!1932) lt!434934))))

(assert (=> b!980040 (= lt!434938 (+!3005 lt!434937 lt!434936))))

(declare-fun minValue!1220 () V!35241)

(assert (=> b!980040 (= lt!434936 (tuple2!14693 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-fun lt!434941 () Unit!32476)

(assert (=> b!980040 (= lt!434941 (addCommutativeForDiffKeys!609 lt!434937 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29519 _keys!1544) from!1932) lt!434934))))

(declare-fun defaultEntry!1281 () Int)

(declare-datatypes ((ValueCell!10865 0))(
  ( (ValueCellFull!10865 (v!13958 V!35241)) (EmptyCell!10865) )
))
(declare-datatypes ((array!61324 0))(
  ( (array!61325 (arr!29520 (Array (_ BitVec 32) ValueCell!10865)) (size!30001 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61324)

(declare-fun get!15315 (ValueCell!10865 V!35241) V!35241)

(declare-fun dynLambda!1751 (Int (_ BitVec 64)) V!35241)

(assert (=> b!980040 (= lt!434934 (get!15315 (select (arr!29520 _values!1278) from!1932) (dynLambda!1751 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!980040 (= lt!434937 (+!3005 lt!434935 lt!434943))))

(assert (=> b!980040 (= lt!434943 (tuple2!14693 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3418 (array!61322 array!61324 (_ BitVec 32) (_ BitVec 32) V!35241 V!35241 (_ BitVec 32) Int) ListLongMap!13379)

(assert (=> b!980040 (= lt!434935 (getCurrentListMapNoExtraKeys!3418 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!980041 () Bool)

(declare-fun res!655934 () Bool)

(assert (=> b!980041 (=> (not res!655934) (not e!552394))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61322 (_ BitVec 32)) Bool)

(assert (=> b!980041 (= res!655934 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!980042 () Bool)

(declare-fun res!655932 () Bool)

(assert (=> b!980042 (=> (not res!655932) (not e!552394))))

(assert (=> b!980042 (= res!655932 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!980044 () Bool)

(declare-fun e!552393 () Bool)

(assert (=> b!980044 (= e!552393 tp_is_empty!22693)))

(declare-fun b!980045 () Bool)

(declare-fun res!655931 () Bool)

(assert (=> b!980045 (=> (not res!655931) (not e!552394))))

(assert (=> b!980045 (= res!655931 (and (= (size!30001 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30000 _keys!1544) (size!30001 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!980046 () Bool)

(declare-fun e!552398 () Bool)

(declare-fun mapRes!36068 () Bool)

(assert (=> b!980046 (= e!552398 (and e!552396 mapRes!36068))))

(declare-fun condMapEmpty!36068 () Bool)

(declare-fun mapDefault!36068 () ValueCell!10865)

(assert (=> b!980046 (= condMapEmpty!36068 (= (arr!29520 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10865)) mapDefault!36068)))))

(declare-fun b!980047 () Bool)

(declare-fun res!655935 () Bool)

(assert (=> b!980047 (=> (not res!655935) (not e!552394))))

(assert (=> b!980047 (= res!655935 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30000 _keys!1544))))))

(declare-fun mapIsEmpty!36068 () Bool)

(assert (=> mapIsEmpty!36068 mapRes!36068))

(declare-fun mapNonEmpty!36068 () Bool)

(declare-fun tp!68540 () Bool)

(assert (=> mapNonEmpty!36068 (= mapRes!36068 (and tp!68540 e!552393))))

(declare-fun mapValue!36068 () ValueCell!10865)

(declare-fun mapRest!36068 () (Array (_ BitVec 32) ValueCell!10865))

(declare-fun mapKey!36068 () (_ BitVec 32))

(assert (=> mapNonEmpty!36068 (= (arr!29520 _values!1278) (store mapRest!36068 mapKey!36068 mapValue!36068))))

(declare-fun b!980043 () Bool)

(declare-fun res!655930 () Bool)

(assert (=> b!980043 (=> (not res!655930) (not e!552394))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!980043 (= res!655930 (validKeyInArray!0 (select (arr!29519 _keys!1544) from!1932)))))

(declare-fun res!655933 () Bool)

(assert (=> start!83872 (=> (not res!655933) (not e!552394))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83872 (= res!655933 (validMask!0 mask!1948))))

(assert (=> start!83872 e!552394))

(assert (=> start!83872 true))

(assert (=> start!83872 tp_is_empty!22693))

(declare-fun array_inv!22847 (array!61324) Bool)

(assert (=> start!83872 (and (array_inv!22847 _values!1278) e!552398)))

(assert (=> start!83872 tp!68539))

(declare-fun array_inv!22848 (array!61322) Bool)

(assert (=> start!83872 (array_inv!22848 _keys!1544)))

(assert (= (and start!83872 res!655933) b!980045))

(assert (= (and b!980045 res!655931) b!980041))

(assert (= (and b!980041 res!655934) b!980038))

(assert (= (and b!980038 res!655929) b!980047))

(assert (= (and b!980047 res!655935) b!980043))

(assert (= (and b!980043 res!655930) b!980042))

(assert (= (and b!980042 res!655932) b!980040))

(assert (= (and b!980040 (not res!655928)) b!980037))

(assert (= (and b!980046 condMapEmpty!36068) mapIsEmpty!36068))

(assert (= (and b!980046 (not condMapEmpty!36068)) mapNonEmpty!36068))

(get-info :version)

(assert (= (and mapNonEmpty!36068 ((_ is ValueCellFull!10865) mapValue!36068)) b!980044))

(assert (= (and b!980046 ((_ is ValueCellFull!10865) mapDefault!36068)) b!980039))

(assert (= start!83872 b!980046))

(declare-fun b_lambda!14725 () Bool)

(assert (=> (not b_lambda!14725) (not b!980040)))

(declare-fun t!29160 () Bool)

(declare-fun tb!6497 () Bool)

(assert (=> (and start!83872 (= defaultEntry!1281 defaultEntry!1281) t!29160) tb!6497))

(declare-fun result!12991 () Bool)

(assert (=> tb!6497 (= result!12991 tp_is_empty!22693)))

(assert (=> b!980040 t!29160))

(declare-fun b_and!31463 () Bool)

(assert (= b_and!31461 (and (=> t!29160 result!12991) b_and!31463)))

(declare-fun m!906995 () Bool)

(assert (=> b!980038 m!906995))

(declare-fun m!906997 () Bool)

(assert (=> b!980040 m!906997))

(declare-fun m!906999 () Bool)

(assert (=> b!980040 m!906999))

(declare-fun m!907001 () Bool)

(assert (=> b!980040 m!907001))

(declare-fun m!907003 () Bool)

(assert (=> b!980040 m!907003))

(assert (=> b!980040 m!907001))

(declare-fun m!907005 () Bool)

(assert (=> b!980040 m!907005))

(declare-fun m!907007 () Bool)

(assert (=> b!980040 m!907007))

(declare-fun m!907009 () Bool)

(assert (=> b!980040 m!907009))

(declare-fun m!907011 () Bool)

(assert (=> b!980040 m!907011))

(declare-fun m!907013 () Bool)

(assert (=> b!980040 m!907013))

(declare-fun m!907015 () Bool)

(assert (=> b!980040 m!907015))

(assert (=> b!980040 m!907005))

(assert (=> b!980040 m!907015))

(declare-fun m!907017 () Bool)

(assert (=> b!980040 m!907017))

(declare-fun m!907019 () Bool)

(assert (=> start!83872 m!907019))

(declare-fun m!907021 () Bool)

(assert (=> start!83872 m!907021))

(declare-fun m!907023 () Bool)

(assert (=> start!83872 m!907023))

(declare-fun m!907025 () Bool)

(assert (=> b!980037 m!907025))

(assert (=> b!980037 m!907025))

(declare-fun m!907027 () Bool)

(assert (=> b!980037 m!907027))

(assert (=> b!980037 m!907001))

(assert (=> b!980037 m!907001))

(declare-fun m!907029 () Bool)

(assert (=> b!980037 m!907029))

(declare-fun m!907031 () Bool)

(assert (=> mapNonEmpty!36068 m!907031))

(assert (=> b!980043 m!907001))

(assert (=> b!980043 m!907001))

(declare-fun m!907033 () Bool)

(assert (=> b!980043 m!907033))

(declare-fun m!907035 () Bool)

(assert (=> b!980041 m!907035))

(check-sat (not start!83872) (not b!980040) (not b_lambda!14725) (not b!980043) (not b!980038) (not mapNonEmpty!36068) (not b!980041) (not b!980037) b_and!31463 tp_is_empty!22693 (not b_next!19699))
(check-sat b_and!31463 (not b_next!19699))
